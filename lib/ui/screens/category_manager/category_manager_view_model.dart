import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryManagerViewModel extends BaseViewModel {
  final CategoryUsecase _categoryUsecase;
  CategoryManagerViewModel(this._categoryUsecase);

  ValueNotifier<bool> isEdit = ValueNotifier(false);

  ValueNotifier<List<CategoryOjbModel>> categoryList = ValueNotifier([]);

  TextEditingController txtCategoryNameController = TextEditingController();

  DataShared get dataShared => DataShared.instance;

  Future<void> initData() async {
    Result<List<CategoryOjbModel>, Exception> result =
        await _categoryUsecase.getCategories();
    if (result.isSuccess) {
      categoryList.value = result.data ?? [];
    } else {
      customLogger(msg: result.error.toString(), typeLogger: TypeLogger.error);
    }
  }

  void reorderCategory(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final CategoryOjbModel item = categoryList.value.removeAt(oldIndex);
    categoryList.value.insert(newIndex, item);

    categoryList.value.asMap().forEach((index, element) {
      categoryList.value[index].indexPos = categoryList.value.length - index;
    });
    //update indexPos
    notifyListeners();
  }

  void updateCategoryList() {
    _categoryUsecase.updateAllCategory(categoryList.value);
    isEdit.value = false;
    dataShared.getCategories();
  }

  bool updateCategory(CategoryOjbModel category) {
    category.categoryName = txtCategoryNameController.text;
    _categoryUsecase.updateCategory(category);
    for (var element in categoryList.value) {
      if (element.id == category.id) {
        element.categoryName = category.categoryName;
      }
    }
    dataShared.getCategories();
    notifyListeners();
    return true;
  }

  Future<bool> deleteCategory(CategoryOjbModel category) async {
    await _categoryUsecase.deleteCategory(category);
    categoryList.value.remove(category);
    await dataShared.getCategories();
    await dataShared.getAccounts();
    notifyListeners();
    return true;
  }
}
