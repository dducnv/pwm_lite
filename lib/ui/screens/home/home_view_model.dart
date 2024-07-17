// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class HomeViewModel extends BaseViewModel {
  final CategoryUsecase sqlCategoryUsecase;
  final AccountUsecase sqlAccountUsecase;
  final TOTPUsecase totpUsecase;

  HomeViewModel({
    required this.sqlCategoryUsecase,
    required this.sqlAccountUsecase,
    required this.totpUsecase,
  });

  final TextEditingController txtSearchKey = TextEditingController();
  final TextEditingController txtCategoryName = TextEditingController();

  final ValueNotifier<bool> isSearch = ValueNotifier(false);
  final ValueNotifier<List<AccountOjbModel>> accountList = ValueNotifier([]);

  final ValueNotifier<CategoryOjbModel> categorySelected = ValueNotifier(
    CategoryOjbModel(
        categoryName: getText(
            GlobalKeys.appRootNavigatorKey.currentState!.context,
            HomeLangDifinition.tatCa)),
  );

  ValueNotifier<bool> isLoadding = ValueNotifier(false);

  ValueNotifier<bool> isAccountEmpty = ValueNotifier(false);
  ValueNotifier<double> progressValueUpdateKey = ValueNotifier(0.0);

  DataShared get dataShared => DataShared.instance;

  Timer? _debounce;

  void initData() async {
    setState(ViewState.busy);
    checkUpdateVersionEncrypKey();
    await dataShared.getAccounts();
    await dataShared.getCategories();
    Future.delayed(const Duration(milliseconds: 500), () {
      dataShared.isLoadding.value = false;
      isAccountEmpty.value = dataShared.accountList.value.isEmpty;
      setState(ViewState.idle);
    });
  }

  Future<void> checkUpdateVersionEncrypKey() async {
    final versionEncrypKey = await SecureStorage.instance
        .read(SecureStorageKeys.versionEncryptKey.name);
    if (versionEncrypKey != Env.versionKey) {
      Provider.of<RootPR>(GlobalKeys.appRootNavigatorKey.currentState!.context,
              listen: false)
          .setRequestUpdateVersionKey(true);
      dataShared.isUpdatedVersionEncryptKey.value = true;
    }
  }

  void handleSelectAccount(AccountOjbModel account) {
    if (dataShared.accountSelected.value.contains(account)) {
      dataShared.accountSelected.value.remove(account);
    } else {
      dataShared.accountSelected.value.add(account);
    }
    notifyListeners();
  }

  void checKAccountEmpty() {
    if (categorySelected.value.id == 0) {
      isAccountEmpty.value = dataShared.accountList.value.isEmpty;
    } else {
      if (dataShared.categoryHomeList.value.isNotEmpty) {
        isAccountEmpty.value =
            dataShared.categoryHomeList.value[0].accounts.isEmpty;
      } else {
        isAccountEmpty.value = true;
      }
    }
  }

  void handleFilterByCategory(CategoryOjbModel category) {
    setState(ViewState.busy);
    isLoadding.value = true;
    categorySelected.value = category;
    if (categorySelected.value.id == 0) {
      dataShared.categoryHomeList.value = dataShared.categoriesList.value;
      isAccountEmpty.value = dataShared.accountList.value.isEmpty;
    } else {
      dataShared.categoryHomeList.value = dataShared.categoriesList.value
          .where((element) => element.id == categorySelected.value.id)
          .toList();
      isAccountEmpty.value =
          dataShared.categoryHomeList.value[0].accounts.isEmpty;
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      isLoadding.value = false;
      setState(ViewState.idle);
    });
  }

  Future<bool> handleCreateCategory({
    required BuildContext context,
  }) async {
    if (txtCategoryName.text.isEmpty) {
      return false;
    }

    CategoryOjbModel categoryModel =
        CategoryOjbModel(categoryName: txtCategoryName.text);

    Result<CategoryOjbModel, Exception> result =
        await sqlCategoryUsecase.saveCategory(categoryModel);

    if (result.isSuccess) {
      dataShared.getCategories();
      txtCategoryName.clear();
      Navigator.pop(context);
      return true;
    } else {
      customLogger(
        msg: result.error.toString(),
        typeLogger: TypeLogger.error,
      );
      return false;
    }
  }

  void handleDeleteAccount({
    required BuildContext context,
    required AccountOjbModel accountModel,
  }) async {
    Result<bool, Exception> result =
        await sqlAccountUsecase.deleteAccount(accountModel);
    if (result.isSuccess) {
      dataShared.getAccounts();
      dataShared.getCategories();

      Future.delayed(const Duration(milliseconds: 100), () {
        handleFilterByCategory(categorySelected.value);
      });

      Navigator.pop(context);
    } else {
      customLogger(
        msg: result.error.toString(),
        typeLogger: TypeLogger.error,
      );
    }
  }

  void handleSearchAccount() {
    setState(ViewState.busy);
    // bounce search
    if (txtSearchKey.text == "") {
      accountList.value.clear();
      notifyListeners();
      setState(ViewState.idle);
      return;
    }
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    isSearch.value = true;
    _debounce = Timer(const Duration(milliseconds: 500), () {
      accountList.value = dataShared.accountList.value
          .where((element) =>
              decryptInfo(element.title)
                  .toLowerCase()
                  .contains(txtSearchKey.text.toLowerCase()) ||
              decryptInfo(element.email ?? "")
                  .toLowerCase()
                  .contains(txtSearchKey.text.toLowerCase()))
          .toList();

      isSearch.value = false;
      setState(ViewState.idle);
      notifyListeners();
    });
  }

  void handleDeleteAllAccount() async {
    dataShared.isLoadding.value = true;
    Result<bool, Exception> result = await sqlAccountUsecase.deleteAll(
      dataShared.accountSelected.value,
    );
    if (result.isSuccess) {
      dataShared.isLoadding.value = false;
      dataShared.accountSelected.value.clear();
      dataShared.getAccounts();
      dataShared.getCategories();
      Future.delayed(const Duration(milliseconds: 100), () {
        handleFilterByCategory(categorySelected.value);
      });
    } else {
      dataShared.isLoadding.value = false;
      customLogger(
        msg: result.error.toString(),
        typeLogger: TypeLogger.error,
      );
    }
  }

  void handleUpdateCategoryForAccount(CategoryOjbModel category) async {
    dataShared.isLoadding.value = true;
    for (var element in dataShared.accountSelected.value) {
      element.category.target = category;
    }

    Result<bool, Exception> result = await sqlAccountUsecase.saveAll(
      dataShared.accountSelected.value,
    );

    if (result.isSuccess) {
      dataShared.isLoadding.value = false;
      dataShared.accountSelected.value.clear();
      dataShared.getAccounts();
      dataShared.getCategories();
      Future.delayed(const Duration(milliseconds: 100), () {
        handleFilterByCategory(categorySelected.value);
      });
    } else {
      dataShared.isLoadding.value = false;
      customLogger(
        msg: result.error.toString(),
        typeLogger: TypeLogger.error,
      );
    }
  }

  //update key
  List<AccountOjbModel> accountsUpdatedKey = [];
  Future<void> handleUpdateKey() async {
    dataShared.isLoadding.value = true;
    Provider.of<RootPR>(GlobalKeys.appRootNavigatorKey.currentState!.context,
            listen: false)
        .setRequestUpdateVersionKey(false);
    await _handleUpdateKeyForPinCode();
    await SecureStorage.instance
        .save(SecureStorageKeys.versionEncryptKey.name, Env.versionKey);
    await sqlAccountUsecase.saveAll(accountsUpdatedKey);
    dataShared.isUpdatedVersionEncryptKey.value = false;
    await dataShared.getAccounts();
    await dataShared.getCategories();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (dataShared.accountList.value.isNotEmpty) {
        exportBackupFile();
      }
      dataShared.isLoadding.value = false;
      handleFilterByCategory(categorySelected.value);
    });
  }

  Future<void> handleUpdateKeyForAccount() async {
    int totalAccount = dataShared.accountList.value.length;
    for (var account in dataShared.accountList.value) {
      account.title =
          _encryptField(decryptInfo(account.title), Env.infoEncryptKey);
      account.email =
          _encryptField(decryptInfo(account.email ?? ""), Env.infoEncryptKey);
      account.password = _encryptField(
          decryptPassword(account.password ?? ""), Env.passwordEncryptKey);
      account.notes =
          _encryptField(decryptInfo(account.notes ?? ""), Env.infoEncryptKey);

      if (account.totp.target != null) {
        account.totp.target?.secretKey = _encryptField(
            decryptTOTPKey(account.totp.target?.secretKey ?? ""),
            Env.totpEncryptKey);
        totpUsecase.updateTOTP(account.totp.target!);
      }

      if (account.customFields.isNotEmpty) {
        for (var customField in account.customFields) {
          customField.value = _encryptField(
              customField.typeField == "password"
                  ? decryptPassword(customField.value)
                  : decryptInfo(customField.value),
              customField.typeField == "password"
                  ? Env.passwordEncryptKey
                  : Env.infoEncryptKey);
        }
      }

      if (account.passwordHistories.isNotEmpty) {
        for (var passwordHistory in account.passwordHistories) {
          passwordHistory.password = _encryptField(
              decryptPassword(passwordHistory.password),
              Env.passwordEncryptKey);
        }
      }

      await Future.delayed(const Duration(milliseconds: 20), () {
        totalAccount--;
        progressValueUpdateKey.value =
            1 - (totalAccount / dataShared.accountList.value.length);
        accountsUpdatedKey.add(account);
      });
    }
  }

  Future<void> _handleUpdateKeyForPinCode() async {
    String pinCode =
        await SecureStorage.instance.read(SecureStorageKeys.pinCode.name) ?? "";
    if (pinCode.isEmpty) return;
    String codeEncrypted = EncryptData.instance.encryptFernet(
      key: Env.pinCodeKeyEncrypt,
      value: decriptPinCode(pinCode),
    );
    await SecureStorage.instance
        .save(SecureStorageKeys.pinCode.name, codeEncrypted);
  }

  String _encryptField(String value, String key) {
    if (value.isEmpty) {
      return "";
    }
    return EncryptData.instance.encryptFernet(
      key: key,
      value: value,
    );
  }

  Future<void> exportBackupFile() async {
    try {
      dataShared.isLoadding.value = true;
      List<AccountOjbModel> accounts = [];
      sqlAccountUsecase.getAccounts().then((value) {
        if (value.isSuccess) {
          if (value.data != null) {
            for (var account in value.data!) {
              accounts.add(
                AccountOjbModel(
                  id: account.id,
                  email: account.email,
                  password: account.password,
                  title: account.title,
                  notes: account.notes,
                  icon: account.icon,
                  passwordUpdatedAt: account.passwordUpdatedAt,
                  categoryOjbModel: account.category.target,
                  totpOjbModel: account.totp.target,
                  customFieldOjbModel: account.customFields,
                  passwordHistoriesList: account.passwordHistories,
                ),
              );
            }
          }
        } else {
          customLogger(msg: "${value.error}", typeLogger: TypeLogger.error);
        }
      });

      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      String dateTime =
          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}_${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}";
      String fileName = "backup_cyber_safe_$dateTime.enc";

      // Get the directory for storing the file in the downloads folder
      Directory? downloadsDirectory = await _getDownloadsDirectory();
      if (downloadsDirectory != null) {
        String directoryPath = path.join(downloadsDirectory.path, 'cyber_safe');
        Directory cyperSafeDir = Directory(directoryPath);

        // Create the 'cyber_safe' directory if it doesn't exist
        if (!cyperSafeDir.existsSync()) {
          cyperSafeDir.createSync(recursive: true);
        }

        // Create the backup file
        File backupFile = File(path.join(directoryPath, fileName));
        bool isRequiredPinCodeForFileBackup = false;

        final isRequiredPinCodeForFileBackupResult = await SecureStorage
            .instance
            .read(SecureStorageKeys.isRequiredPinCodeForFileBackup.name);

        if (isRequiredPinCodeForFileBackupResult != null) {
          isRequiredPinCodeForFileBackup =
              isRequiredPinCodeForFileBackupResult == "true";
        }

        String pinCode = "";
        if (isRequiredPinCodeForFileBackup) {
          pinCode = await SecureStorage.instance
                  .read(SecureStorageKeys.pinCode.name) ??
              "";
        }

        String jsonString = jsonEncode({
          'pinCode': pinCode,
          'accounts': accounts.map((account) => account.toJson()).toList(),
        });

        customLogger(msg: jsonString, typeLogger: TypeLogger.warning);
        // Encrypt the file
        final codeEncrypted = EncryptData.instance.encryptFernetBytes(
            data: utf8.encode(jsonString), key: Env.fileEncryptKey);
        backupFile.writeAsBytesSync(codeEncrypted);
        await Share.shareXFiles([XFile(backupFile.path)],
            text: 'CyberSafe Backup File $dateTime');

        showToast(
          getText(GlobalKeys.appRootNavigatorKey.currentContext!,
              SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong),
          context: GlobalKeys.appRootNavigatorKey.currentContext!,
          animation: StyledToastAnimation.slideFromTop,
        );

        customLogger(
            msg: "Backup file success: ${backupFile.path}",
            typeLogger: TypeLogger.info);
        dataShared.isLoadding.value = false;
      } else {
        dataShared.isLoadding.value = false;
        showToast(
          getText(GlobalKeys.appRootNavigatorKey.currentContext!,
              SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu),
          context: GlobalKeys.appRootNavigatorKey.currentContext!,
          backgroundColor: Colors.redAccent,
          animation: StyledToastAnimation.size,
        );

        customLogger(
            msg: "Could not access downloads directory",
            typeLogger: TypeLogger.error);
      }
    } catch (e) {
      dataShared.isLoadding.value = false;
      showToast(
        getText(GlobalKeys.appRootNavigatorKey.currentContext!,
            SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu),
        context: GlobalKeys.appRootNavigatorKey.currentContext!,
        backgroundColor: Colors.redAccent,
        animation: StyledToastAnimation.size,
      );
      customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
    }
  }

  Future<Directory?> _getDownloadsDirectory() async {
    try {
      Directory downloadDirectory = await getDownloadDirectory();
      return downloadDirectory;
    } catch (e) {
      customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
      return null;
    }
  }
}
