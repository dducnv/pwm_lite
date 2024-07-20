import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class CreateAccountViewModel extends BaseViewModel {
  final CategoryUsecase categoryUsecase;
  final AccountUsecase accountUsecase;
  final AccountCustomFieldUsecase accountCustomFieldUsecase;

  CreateAccountViewModel({
    required this.categoryUsecase,
    required this.accountUsecase,
    required this.accountCustomFieldUsecase,
  });

  final TextEditingController txtAppName = TextEditingController();
  final ValueNotifier<bool> isRequiredAppName = ValueNotifier<bool>(false);

  final TextEditingController txtFieldTitle = TextEditingController();
  final ValueNotifier<bool> isRequiredFieldTitle = ValueNotifier<bool>(false);

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final passNotifier = ValueNotifier<PasswordStrength?>(null);

  final TextEditingController txtNote = TextEditingController();
  final TextEditingController txtCategoryName = TextEditingController();

  ValueNotifier<List<DynamicTextField>> dynamicTextFieldNotifier =
      ValueNotifier<List<DynamicTextField>>([]);

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

  ValueNotifier<BranchLogo> branchLogoSelected = ValueNotifier<BranchLogo>(
    BranchLogo(
      [],
      "default",
    ),
  );

  final ValueNotifier<bool> isRequiredSelectCategory =
      ValueNotifier<bool>(false);

  DataShared get dataShared => DataShared.instance;

  void initData() {
    resetFields();
    handleGetCategories();
  }

  Future<void> handleAddAccount(BuildContext context) async {
    if (txtAppName.text.isEmpty) {
      isRequiredAppName.value = true;
      return;
    }

    if (categorySelected.value.id == 0) {
      isRequiredSelectCategory.value = true;
      return;
    }

    // Hàm mã hóa dữ liệu
    String encryptField(String value, String key) {
      return EncryptData.instance.encryptFernet(
        key: key,
        value: value,
      );
    }

    // Mã hóa các trường dữ liệu
    final String appNameEncrypted =
        encryptField(txtAppName.text, Env.infoEncryptKey);
    final String usernameEncrypted = txtUsername.text.isNotEmpty
        ? encryptField(txtUsername.text, Env.infoEncryptKey)
        : '';
    final String passwordEncrypted = txtPassword.text.isNotEmpty
        ? encryptField(txtPassword.text, Env.passwordEncryptKey)
        : '';
    final String noteEncrypted = txtNote.text.isNotEmpty
        ? encryptField(txtNote.text, Env.infoEncryptKey)
        : '';

    // Tạo đối tượng AccountOjbModel
    final account = AccountOjbModel(
      icon: branchLogoSelected.value.branchLogoSlug,
      title: appNameEncrypted,
      email: usernameEncrypted,
      password: passwordEncrypted,
      notes: noteEncrypted,
    )..category.target = categorySelected.value;

    // Mã hóa và thêm các trường tùy chỉnh
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

    account.customFields.addAll(customFields);

    final result = await accountUsecase.saveAccount(account);

    if (result.isSuccess) {
      resetFields();
      dataShared.getAccounts();
      dataShared.getCategories();
      customLogger(msg: "Create account success", typeLogger: TypeLogger.info);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop({"category": account.category.target});
    } else {
      customLogger(
          msg: "Create account error ${result.error}",
          typeLogger: TypeLogger.error);
    }
  }

  void resetFields() {
    txtAppName.clear();
    txtUsername.clear();
    txtPassword.clear();
    txtNote.clear();
    dynamicTextFieldNotifier.value = [];
    typeTextFieldSelected.value = typeTextFields[0];
    categorySelected.value = CategoryOjbModel(
      categoryName: getText(GlobalKeys.appRootNavigatorKey.currentContext!,
          CreateAccountLangDif.chonDanhMuc),
    );
    notifyListeners();
  }

  void handleAddField() {
    if (txtFieldTitle.text.isEmpty) {
      isRequiredFieldTitle.value = true;
      return;
    }
    final controller = TextEditingController();
    final key = txtFieldTitle.text.toLowerCase().trim().replaceAll(" ", "_");
    final field = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomTextField(
              autoFocus: true,
              requiredTextField: false,
              titleTextField: txtFieldTitle.text,
              controller: controller,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              hintText: txtFieldTitle.text,
              isObscure:
                  typeTextFieldSelected.value.type == "password" ? true : false,
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

    dynamicTextFieldNotifier.value.add(
      DynamicTextField(
        key: key,
        controller: controller,
        customField: CustomField(
            key: txtFieldTitle.text.toLowerCase().trim().replaceAll(" ", "_"),
            hintText: txtFieldTitle.text,
            typeField: typeTextFieldSelected.value),
        field: field,
      ),
    );
    txtFieldTitle.clear();
    notifyListeners();
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
    txtNote.dispose();
    txtCategoryName.dispose();

    super.dispose();
  }
}

class DynamicTextField {
  final String key;

  final TextEditingController controller;
  final Widget field;
  final CustomField customField;
  DynamicTextField({
    required this.key,
    required this.controller,
    required this.customField,
    required this.field,
  });
}

class CustomField {
  final String key;
  final String hintText;
  final TypeTextField typeField;

  CustomField({
    required this.key,
    required this.hintText,
    required this.typeField,
  });
}
