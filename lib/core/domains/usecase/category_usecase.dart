import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';

abstract class CategoryUsecase {
  Future<Result<List<CategoryOjbModel>, Exception>> getCategories();
  Future<Result<List<CategoryOjbModel>, Exception>> getCategoriesWithAccounts();
  Future<Result<CategoryOjbModel, Exception>> getCategory(int uid);
  Future<Result<CategoryOjbModel, Exception>> saveCategory(
      CategoryOjbModel category);
  Future<Result<bool, Exception>> deleteCategory(CategoryOjbModel category);
  Future<Result<bool, Exception>> updateCategory(CategoryOjbModel category);
  Future<Result<bool, Exception>> updateAllCategory(
      List<CategoryOjbModel> category);

  Future<Result<CategoryOjbModel, Exception>> findCategoryByName(String name);
}
