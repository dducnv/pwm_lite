import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/service_locator.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/main.dart';
import 'package:cyber_safe/ui/resource/category_data_seed.dart';
import 'package:flutter/material.dart';

class DataShared extends ChangeNotifier {
  static final instance = DataShared._internal();

  DataShared._internal();

  ValueNotifier<bool> isUpdatedVersionEncryptKey = ValueNotifier(false);

  final CategoryUsecase _categoryUsecase = locator.get<CategoryUsecase>(
      instanceName: DependencyInstance.ojbCategoryUsecase.name);
  final AccountUsecase _accountUsecase = locator.get<AccountUsecase>(
      instanceName: DependencyInstance.ojbAccountUsecase.name);

  final ValueNotifier<bool> isLoadding = ValueNotifier(false);

  final ValueNotifier<List<AccountOjbModel>> accountSelected =
      ValueNotifier([]);

  final ValueNotifier<List<AccountOjbModel>> accountList = ValueNotifier([]);
  final ValueNotifier<List<CategoryOjbModel>> categoriesList =
      ValueNotifier([]);
  final ValueNotifier<List<CategoryOjbModel>> categoryHomeList =
      ValueNotifier([]);

  Future<void> getCategories() async {
    try {
      _categoryUsecase.getCategories().then((value) {
        if (value.isSuccess) {
          final categories = value.data ?? [];
          categoryHomeList.value = [...categories];
          categoriesList.value = [...categories];
        } else {
          customLogger(msg: "${value.error}", typeLogger: TypeLogger.error);
        }
      });
    } catch (e) {
      customLogger(msg: "$e", typeLogger: TypeLogger.error);
    }
  }

  Future<void> getAccounts() async {
    try {
      _accountUsecase.getAccounts().then((value) {
        if (value.isSuccess) {
          final accounts = value.data ?? [];
          accountList.value = [...accounts];
        } else {
          customLogger(msg: "${value.error}", typeLogger: TypeLogger.error);
        }
      });
    } catch (e) {
      customLogger(msg: "$e", typeLogger: TypeLogger.error);
    }
  }

  Future<void> initCategory() async {
    for (var element in categoryDataSeed) {
      _categoryUsecase.saveCategory(CategoryOjbModel(
          categoryName: getText(
              GlobalKeys.appRootNavigatorKey.currentContext!, element)));
    }
  }
}
