// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions/setting_manager_lang_definition.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:permission_handler/permission_handler.dart';

class SettingViewModel extends BaseViewModel {
  late CategoryUsecase _categoryUsecase;
  late AccountUsecase _accountUsecase;

  List<AccountOjbModel> accounts = [];

  ValueNotifier<int> csvCount = ValueNotifier<int>(0);
  ValueNotifier<int> timeAutoLock = ValueNotifier<int>(5);
  ValueNotifier<bool> isOpenAutoLock = ValueNotifier<bool>(false);

  ValueNotifier<bool> isRequiredPinCodeForFileBackup =
      ValueNotifier<bool>(false);

  DataShared get dataShared => DataShared.instance;

  SettingViewModel(
      {required CategoryUsecase categoryUsecase,
      required AccountUsecase accountUsecase}) {
    _categoryUsecase = categoryUsecase;
    _accountUsecase = accountUsecase;
  }

  Future<void> init() async {
    getData();
    final isRequiredPinCodeForFileBackupResult = await SecureStorage.instance
        .read(SecureStorageKeys.isRequiredPinCodeForFileBackup.name);
    if (isRequiredPinCodeForFileBackupResult != null) {
      isRequiredPinCodeForFileBackup.value =
          isRequiredPinCodeForFileBackupResult == "true";
    } else {
      isRequiredPinCodeForFileBackup.value = false;
    }
  }

  void toggleRequiredPinCodeForFileBackup() {
    isRequiredPinCodeForFileBackup.value =
        !isRequiredPinCodeForFileBackup.value;
    SecureStorage.instance.save(
        SecureStorageKeys.isRequiredPinCodeForFileBackup.name,
        isRequiredPinCodeForFileBackup.value.toString());
  }

  Future<void> getData() async {
    _accountUsecase.getAccounts().then((value) {
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
  }

  Future<void> exportBackupFile() async {
    try {
      dataShared.isLoadding.value = true;
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      String dateTime =
          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}_${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}";
      String fileName = "backup_cyber_safe_$dateTime.enc";

      // Get the directory for storing the file in the downloads folder
      Directory? downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        String directoryPath = path.join(downloadsDirectory.path, 'cyber_safe');
        Directory cyperSafeDir = Directory(directoryPath);

        // Create the 'cyber_safe' directory if it doesn't exist
        if (!cyperSafeDir.existsSync()) {
          cyperSafeDir.createSync(recursive: true);
        }

        // Create the backup file
        File backupFile = File(path.join(directoryPath, fileName));

        String pinCode = "";
        if (isRequiredPinCodeForFileBackup.value) {
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

  Future<Directory?> getDownloadsDirectory() async {
    try {
      Directory downloadDirectory = await getDownloadDirectory();
      return downloadDirectory;
    } catch (e) {
      customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
      return null;
    }
  }

  Future<void> importBackupFile(
    BuildContext context,
  ) async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.any);

      if (result == null) {
        showToast(
          getText(GlobalKeys.appRootNavigatorKey.currentContext!,
              SettingLangDef.khongCoFileNaoDuocChon),
          context: GlobalKeys.appRootNavigatorKey.currentContext!,
          backgroundColor: Colors.redAccent,
          animation: StyledToastAnimation.size,
        );

        customLogger(msg: "No file selected", typeLogger: TypeLogger.warning);
        return;
      }

      PlatformFile pickedFile = result.files.first;

      if (pickedFile.extension != 'enc') {
        showToast(
          getText(GlobalKeys.appRootNavigatorKey.currentContext!,
              SettingLangDef.fileKhongDungDinhDang),
          context: GlobalKeys.appRootNavigatorKey.currentContext!,
          backgroundColor: Colors.redAccent,
          animation: StyledToastAnimation.size,
        );
        customLogger(
            msg: "File is not encrypted", typeLogger: TypeLogger.error);
        return;
      }

      File file = File(pickedFile.path!);
      List<int> encryptedBytes = file.readAsBytesSync();

      final decryptedBytes = EncryptData.instance.decryptFernetBytes(
        encryptedData: encryptedBytes,
        key: Env.fileEncryptKey,
      );

      String jsonString = utf8.decode(decryptedBytes);
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final pinCode = jsonData['pinCode'] as String;
      if (pinCode.isEmpty) {
        dataShared.isLoadding.value = true;
        syncData(jsonData, isHasPinCode: false);
      } else {
        // ignore: use_build_context_synchronously
        String pinCodeDecrypted = decriptPinCode(pinCode);
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return LocalAuthScreen(
              isPinFileImport: true,
              onCallBackWithPin: (pin, appPinCodeKey) {
                if (pin.text == pinCodeDecrypted) {
                  dataShared.isLoadding.value = true;
                  syncData(jsonData, isHasPinCode: true, context: context);
                } else {
                  appPinCodeKey.currentState!.triggerErrorAnimation();
                  pin.clear();
                }
              },
            );
          }),
        );
      }
    } catch (e) {
      showToast(
        getText(GlobalKeys.appRootNavigatorKey.currentContext!,
            SettingLangDef.khoiPhucDuLieuThatBai),
        context: GlobalKeys.appRootNavigatorKey.currentContext!,
        backgroundColor: Colors.redAccent,
        animation: StyledToastAnimation.size,
      );
      dataShared.isLoadding.value = false;
      customLogger(msg: "Error: ${e.toString()}", typeLogger: TypeLogger.error);
    }
  }

  Future<void> syncData(
    Map<String, dynamic> jsonData, {
    final bool? isHasPinCode,
    final BuildContext? context,
  }) async {
    dataShared.isLoadding.value = true;
    List<AccountOjbModel> newAccounts = (jsonData['accounts'] as List)
        .map((json) => AccountOjbModel.fromJson(json))
        .toList();

    for (var newAccount in newAccounts) {
      newAccount.categoryOjbModel ??= CategoryOjbModel(categoryName: "Backup");
      var existingAccount = findMatchingAccount(accounts, newAccount);
      if (existingAccount.title == "") {
        // Create and save new account if no match is found

        await saveAccount(newAccount);
        accounts
            .add(newAccount); // Add to the existing accounts list after saving
      } else {
        // Update existing account if necessary
        bool updated = false;

        if (existingAccount.totpOjbModel == null &&
            newAccount.totpOjbModel != null) {
          existingAccount.totpOjbModel = newAccount.totpOjbModel;
          updated = true;
        }

        // Add custom fields from new account if they exist
        if (newAccount.customFields.isNotEmpty) {
          existingAccount.customFields.addAll(newAccount.customFields);
          updated = true;
        }

        if (newAccount.passwordHistories.isNotEmpty) {
          existingAccount.passwordHistories
              .addAll(newAccount.passwordHistories);
          updated = true;
        }

        if (updated) {
          Result<bool, Exception> saveResult =
              await _accountUsecase.updateAccount(existingAccount);
          if (saveResult.isSuccess) {
            customLogger(
                msg:
                    "Updated existing account: ${existingAccount.title}, ${existingAccount.email}",
                typeLogger: TypeLogger.info);
          } else {
            customLogger(
                msg: "Failed to update existing account",
                typeLogger: TypeLogger.error);
          }
        } else {
          customLogger(
              msg:
                  "No updates required for account: ${existingAccount.title}, ${existingAccount.email}",
              typeLogger: TypeLogger.info);
        }
      }
    }

    dataShared.getAccounts();
    dataShared.getCategories();
    showToast(
      getText(GlobalKeys.appRootNavigatorKey.currentContext!,
          SettingLangDef.khoiPhucDuLieuThanhCong),
      context: GlobalKeys.appRootNavigatorKey.currentContext!,
      animation: StyledToastAnimation.slideFromTop,
    );
    customLogger(
        msg: "Import backup file success", typeLogger: TypeLogger.info);
    dataShared.isLoadding.value = false;
    if (isHasPinCode != null && isHasPinCode) {
      // ignore: use_build_context_synchronously
      Navigator.of(context!).pop();
    }
  }

  AccountOjbModel findMatchingAccount(
      List<AccountOjbModel> accounts, AccountOjbModel newAccount) {
    return accounts.firstWhere(
        (account) =>
            decryptInfo(account.title) == decryptInfo(newAccount.title) &&
            decryptInfo(account.email ?? "") ==
                decryptInfo(newAccount.email ?? ""),
        orElse: () => AccountOjbModel(title: ""));
  }

  bool accountExists(
      List<AccountOjbModel> accounts, AccountOjbModel newAccount) {
    return accounts.any((account) =>
        decryptInfo(account.title) == decryptInfo(newAccount.title) &&
        decryptInfo(account.email ?? "") ==
            decryptInfo(newAccount.email ?? ""));
  }

  Future<void> importGooglePasswordsManagerFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['csv']);
      if (result == null) {
        showToast(
          getText(GlobalKeys.appRootNavigatorKey.currentContext!,
              SettingLangDef.khongCoFileNaoDuocChon),
          context: GlobalKeys.appRootNavigatorKey.currentContext!,
          backgroundColor: Colors.redAccent,
          animation: StyledToastAnimation.size,
        );

        customLogger(msg: "No file selected", typeLogger: TypeLogger.warning);
        return;
      }
      dataShared.isLoadding.value = true;
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name.replaceAll(".csv", "");

      String csvString = await file.readAsString();

      List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(csvString);

      csvCount.value = csvTable.skip(1).length;

      for (var row in csvTable.skip(1)) {
        String title = row[0].toString();
        String url = row[1].toString();
        String username = row[2].toString();
        String password = row[3].toString();

        // Mã hóa các trường dữ liệu
        final String appNameEncrypted = encryptField(title, Env.infoEncryptKey);
        final String usernameEncrypted =
            encryptField(username, Env.infoEncryptKey);
        final String passwordEncrypted =
            encryptField(password, Env.passwordEncryptKey);
        final String noteEncrypted = encryptField(url, Env.infoEncryptKey);

        String splitTitle = title.replaceAll(".", " ");
        String iconNew = getIcon(splitTitle);

        AccountOjbModel newAccount = AccountOjbModel(
          title: appNameEncrypted,
          email: usernameEncrypted,
          password: passwordEncrypted,
          notes: noteEncrypted,
          icon: iconNew,
        );
        newAccount.categoryOjbModel = CategoryOjbModel(categoryName: fileName);
        await saveAccount(newAccount);
        csvCount.value--;
      }

      await dataShared.getAccounts();
      await dataShared.getCategories();
      await getData();
      await Future.delayed(const Duration(seconds: 1));
      await exportBackupFile();

      showToast(
        getText(GlobalKeys.appRootNavigatorKey.currentContext!,
            SettingLangDef.khoiPhucDuLieuThanhCong),
        context: GlobalKeys.appRootNavigatorKey.currentContext!,
        animation: StyledToastAnimation.slideFromTop,
      );
      dataShared.isLoadding.value = false;
      customLogger(
          msg: "Import Google Passwords Manager file success: ${file.path}",
          typeLogger: TypeLogger.info);
    } catch (e) {
      dataShared.isLoadding.value = false;
      showToast(
        getText(GlobalKeys.appRootNavigatorKey.currentContext!,
            SettingLangDef.khoiPhucDuLieuThatBai),
        context: GlobalKeys.appRootNavigatorKey.currentContext!,
        backgroundColor: Colors.redAccent,
        animation: StyledToastAnimation.size,
      );

      customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
    }
  }

  String getIcon(
    String keyWork,
  ) {
    for (var icon in allBranchLogos) {
      if (keyWork.toLowerCase().contains(icon.branchLogoSlug!.toLowerCase())) {
        return icon.branchLogoSlug ?? "default";
      }
    }
    return "default";
  }

  String encryptField(String value, String key) {
    if (value.isEmpty) return "";
    return EncryptData.instance.encryptFernet(
      key: key,
      value: value,
    );
  }

  Future<void> saveAccount(AccountOjbModel account) async {
    Result<CategoryOjbModel, Exception> categoryResult = await _categoryUsecase
        .findCategoryByName(account.categoryOjbModel!.categoryName);

    final accountNew = AccountOjbModel(
      title: account.title,
      email: account.email ?? "",
      password: account.password ?? "",
      notes: account.notes ?? "",
      icon: account.icon ?? "",
    );

    if (account.totpOjbModel != null) {
      accountNew.totp.target =
          TOTPOjbModel(secretKey: account.totpOjbModel!.secretKey);
    }

    if (account.customFieldOjbModel != null) {
      for (var customField in account.customFieldOjbModel!) {
        final mewCustomField = AccountCustomFieldOjbModel(
          name: customField.name,
          value: customField.value,
          hintText: customField.hintText,
          typeField: customField.typeField,
        );
        accountNew.customFields.add(mewCustomField);
      }
    }

    if (account.passwordHistoriesList != null) {
      for (var passwordHistory in account.passwordHistoriesList!) {
        final newPasswordHistory = PasswordHistory(
          password: passwordHistory.password,
          createdAt: passwordHistory.createdAt,
        );
        accountNew.passwordHistories.add(newPasswordHistory);
      }
    }

    if (categoryResult.isSuccess) {
      if (categoryResult.data != null &&
          categoryResult.data!.categoryName.isNotEmpty) {
        accountNew.category.target = categoryResult.data!;
      } else {
        accountNew.category.target = await _categoryUsecase
            .saveCategory(CategoryOjbModel(
                categoryName: account.categoryOjbModel!.categoryName))
            .then((value) => value.data!);
      }
    }

    Result<bool, Exception> saveResult =
        await _accountUsecase.saveAccount(accountNew);

    if (saveResult.isSuccess) {
      customLogger(
          msg: "Account saved successfully", typeLogger: TypeLogger.info);
    } else {
      customLogger(msg: "Failed to save account", typeLogger: TypeLogger.error);
    }
  }
}
