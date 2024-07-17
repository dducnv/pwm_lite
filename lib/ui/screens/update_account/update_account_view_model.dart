import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class UpdateAccountViewModel extends BaseViewModel {
  final CategoryUsecase categoryUsecase;
  final AccountUsecase accountUsecase;
  final TOTPUsecase totpUsecase;

  UpdateAccountViewModel({
    required this.accountUsecase,
    required this.categoryUsecase,
    required this.totpUsecase,
  });

  final TextEditingController txtAppName = TextEditingController();
  final ValueNotifier<bool> isRequiredAppName = ValueNotifier<bool>(false);

  final TextEditingController txtFieldTitle = TextEditingController();
  final ValueNotifier<bool> isRequiredFieldTitle = ValueNotifier<bool>(false);

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final passNotifier = ValueNotifier<PasswordStrength?>(null);

  final TextEditingController txtKeySetOTP = TextEditingController();
  final TextEditingController txtNote = TextEditingController();
  final TextEditingController txtCategoryName = TextEditingController();

  ValueNotifier<List<DynamicTextField>> dynamicTextFieldNotifier =
      ValueNotifier<List<DynamicTextField>>([]);

  ValueNotifier<bool> isEnterOTPFromKeyboard = ValueNotifier<bool>(false);

  List<TypeTextField> typeTextFields = [
    TypeTextField(
        title: getText(GlobalKeys.appRootNavigatorKey.currentContext!,
            CreateAccountLangDif.vanBan),
        type: 'text'),
    TypeTextField(
        title: getText(GlobalKeys.appRootNavigatorKey.currentContext!,
            CreateAccountLangDif.vanBanBaoMat),
        type: 'password'),
  ];

  ValueNotifier<String> keyAuthentication = ValueNotifier<String>("");

  ValueNotifier<TypeTextField> typeTextFieldSelected =
      ValueNotifier<TypeTextField>(
    TypeTextField(
        title: getText(GlobalKeys.appRootNavigatorKey.currentContext!,
            CreateAccountLangDif.vanBan),
        type: 'text'),
  );

  /// Category
  ValueNotifier<List<CategoryOjbModel>> listCategory =
      ValueNotifier<List<CategoryOjbModel>>([]);

  ValueNotifier<CategoryOjbModel> categorySelected =
      ValueNotifier<CategoryOjbModel>(
    CategoryOjbModel(
      categoryName: getText(GlobalKeys.appRootNavigatorKey.currentContext!,
          CreateAccountLangDif.chonDanhMuc),
    ),
  );
  final ValueNotifier<bool> isRequiredSelectCategory =
      ValueNotifier<bool>(false);
  ValueNotifier<BranchLogo> branchLogoSelected = ValueNotifier<BranchLogo>(
    BranchLogo(
      [],
      "default",
    ),
  );

  late AccountOjbModel account;

  DataShared get dataShared => DataShared.instance;

  ValueNotifier<bool> isLoadding = ValueNotifier(false);

  void handleShowTextFieldEnterOTP() {
    isEnterOTPFromKeyboard.value = !isEnterOTPFromKeyboard.value;
    setState(ViewState.busy);
  }

  void handleClearKeyAuth() {
    keyAuthentication.value = "";
    txtKeySetOTP.text = "";
    isEnterOTPFromKeyboard = ValueNotifier<bool>(false);
    notifyListeners();
  }

  void initData() {
    handleGetCategories();
  }

  Future<bool> handleUpdateAccount(
    BuildContext context,
  ) async {
    if (txtAppName.text.isEmpty) {
      isRequiredAppName.value = true;
      return false;
    }

    String encryptField(String value, String key) {
      if (value.isEmpty) {
        return "";
      }
      return EncryptData.instance.encryptFernet(
        key: key,
        value: value,
      );
    }

    isLoadding.value = true;
    if (decryptInfo(account.title) != txtAppName.text) {
      account.title = encryptField(txtAppName.text, Env.infoEncryptKey);
    }
    if (decryptInfo(account.email ?? "") != txtUsername.text) {
      account.email = encryptField(txtUsername.text, Env.infoEncryptKey);
    }

    if (decryptPassword(account.password ?? "") != txtPassword.text) {
      String oldPassword = account.password ?? "";
      account.password = encryptField(txtPassword.text, Env.passwordEncryptKey);
      account.passwordUpdatedAt = DateTime.now();
      accountUsecase.addPasswordHistory(account, oldPassword);
    }

    if (decryptInfo(account.notes ?? "") != txtNote.text) {
      account.notes = encryptField(txtNote.text, Env.infoEncryptKey);
    }

    if (account.icon != branchLogoSelected.value.branchLogoSlug) {
      account.icon = branchLogoSelected.value.branchLogoSlug;
    }

    if (account.category.targetId != categorySelected.value.id) {
      account.category.target = categorySelected.value;
    }

    if (keyAuthentication.value.isNotEmpty && account.totp.target == null) {
      account.totp.target = TOTPOjbModel(
        secretKey: encryptField(keyAuthentication.value, Env.totpEncryptKey),
      );
      totpUsecase.saveTOTP(account.totp.target!);
    } else if (keyAuthentication.value.isNotEmpty &&
        account.totp.target != null &&
        decryptTOTPKey(account.totp.target!.secretKey) !=
            keyAuthentication.value) {
      account.totp.target!.secretKey =
          encryptField(keyAuthentication.value, Env.totpEncryptKey);
      account.totp.target!.updatedAt = DateTime.now();
      totpUsecase.updateTOTP(account.totp.target!);
    } else if (keyAuthentication.value.isEmpty && account.totp.target != null) {
      totpUsecase.deleteTOTP(account.totp.target!.id);
      account.totp.target = null;
    }

    final customFields = dynamicTextFieldNotifier.value.map((e) {
      return AccountCustomFieldOjbModel(
        name: e.customField.key,
        value: encryptField(
          e.controller.text,
          e.customField.typeField.type == 'password'
              ? Env.passwordEncryptKey
              : Env.infoEncryptKey,
        ),
        hintText: e.customField.hintText,
        typeField: e.customField.typeField.type,
      );
    }).toList();

    account.customFields.clear();
    account.customFields.addAll(customFields);
    account.updatedAt = DateTime.now();
    accountUsecase.updateAccount(account).then((value) {
      if (value.isSuccess) {
        customLogger(
            msg: "Update account success", typeLogger: TypeLogger.info);
        isLoadding.value = false;
        setState(ViewState.idle);
        Navigator.of(context).pop(true);
        return true;
      } else {
        customLogger(
            msg: "Update account error ${value.error}",
            typeLogger: TypeLogger.error);
      }
      isLoadding.value = false;
    });
    dataShared.getAccounts();
    dataShared.getCategories();
    return false;
  }

  void getDetailAccount(int id) async {
    isLoadding.value = true;
    Result<AccountOjbModel, Exception> getAccount =
        await accountUsecase.getAccount(id);
    if (getAccount.isSuccess) {
      final account = getAccount.data ?? AccountOjbModel(title: "");
      this.account = account;
      branchLogoSelected.value = account.icon == "default" ||
              account.icon == "" ||
              account.icon == null ||
              allBranchLogos
                      .firstWhere(
                          (element) => element.branchLogoSlug == account.icon)
                      .branchLogoSlug ==
                  null
          ? BranchLogo(
              [],
              "default",
            )
          : allBranchLogos
              .firstWhere((element) => element.branchLogoSlug == account.icon);
      txtAppName.text = decryptInfo(account.title);
      txtUsername.text = decryptInfo(account.email ?? "");
      txtPassword.text = decryptPassword(account.password ?? "");
      passNotifier.value = PasswordStrength.calculate(text: txtPassword.text);
      keyAuthentication.value =
          decryptTOTPKey(account.totp.target?.secretKey ?? "");
      txtNote.text = decryptInfo(account.notes ?? "");
      categorySelected.value = account.category.target ??
          CategoryOjbModel(
            categoryName: "Chon danh muc",
          );

      for (var element in account.customFields) {
        handleAddField(
          isFromDetails: true,
          type: typeTextFields
              .where((type) => type.type == element.typeField)
              .first,
          hintText: element.hintText,
          keyField: element.name,
          value: element.typeField == "password"
              ? decryptPassword(element.value)
              : decryptInfo(element.value),
        );
      }
      Future.delayed(const Duration(milliseconds: 200), () {
        isLoadding.value = false;
      });
      setState(ViewState.busy);
    } else {
      customLogger(msg: "${getAccount.error}", typeLogger: TypeLogger.error);
    }
    setState(ViewState.idle);
  }

  void handleAddField(
      {TypeTextField? type,
      String? keyField,
      String? value,
      String? hintText,
      bool isFromDetails = false}) {
    if (txtFieldTitle.text.isEmpty && keyField == null) {
      return;
    }
    final controller = TextEditingController(text: value ?? "");
    final key = keyField ??
        txtFieldTitle.text.toLowerCase().trim().replaceAll(" ", "_");
    final field = fieldCustom(
        controller: controller,
        key: key,
        isFromDetails: isFromDetails,
        hintText: hintText ?? txtFieldTitle.text,
        type: type?.type ?? typeTextFieldSelected.value.type);

    dynamicTextFieldNotifier.value.add(
      DynamicTextField(
        key: key,
        controller: controller,
        customField: CustomField(
            key: key,
            hintText: hintText ?? txtFieldTitle.text,
            typeField: type ?? typeTextFieldSelected.value),
        field: field,
      ),
    );
    txtFieldTitle.clear();

    notifyListeners();
  }

  Widget fieldCustom({
    required TextEditingController controller,
    required String key,
    required String type,
    required String hintText,
    bool isFromDetails = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomTextField(
              autoFocus: !isFromDetails,
              requiredTextField: false,
              titleTextField: hintText,
              controller: controller,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              hintText: hintText,
              isObscure: type == "password" ? true : false,
              maxLines: 1,
            ),
          ),
          IconButton(
            onPressed: () {
              dynamicTextFieldNotifier.value
                  .removeWhere((element) => element.key == key);
              notifyListeners();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Future<bool> handleCreateCategory() async {
    if (txtCategoryName.text.isEmpty) {
      return false;
    }
    CategoryOjbModel category = CategoryOjbModel(
      categoryName: txtCategoryName.text,
    );
    Result<CategoryOjbModel, Exception> result =
        await categoryUsecase.saveCategory(category);
    if (result.isSuccess) {
      customLogger(msg: "Create category success", typeLogger: TypeLogger.info);
      txtCategoryName.clear();
      handleGetCategories();
      return true;
    } else {
      customLogger(
          msg: "Create category error ${result.error}",
          typeLogger: TypeLogger.error);
      return false;
    }
  }

  Future<void> handleGetCategories() async {
    Result<List<CategoryOjbModel>, Exception> result =
        await categoryUsecase.getCategories();

    if (result.isSuccess) {
      listCategory.value = result.data!;
      notifyListeners();
    } else {
      customLogger(
          msg: "Get categories error ${result.error}",
          typeLogger: TypeLogger.error);
    }
  }

  @override
  void dispose() {
    for (var element in dynamicTextFieldNotifier.value) {
      element.controller.dispose();
    }
    txtAppName.dispose();
    txtUsername.dispose();
    txtPassword.dispose();
    txtFieldTitle.dispose();
    txtKeySetOTP.dispose();
    txtNote.dispose();
    txtCategoryName.dispose();

    super.dispose();
  }
}
