import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/objectbox_db.dart';
import 'package:cyber_safe/core/utils/result.dart';
import 'package:cyber_safe/objectbox.g.dart';

class OjbCategoryUsecase extends CategoryUsecase {
  final OjbRepository<CategoryOjbModel> _categoryRepository;
  final OjbRepository<AccountOjbModel> _accountRepository;

  OjbCategoryUsecase(this._categoryRepository, this._accountRepository);

  @override
  Future<Result<bool, Exception>> deleteCategory(
      CategoryOjbModel category) async {
    final query = await getCategory(category.id);
    if (query.data == null) {
      return Future.value(Result(data: false));
    }

    if (query.data?.accounts != null) {
      query.data?.accounts.forEach((element) {
        _accountRepository.delete(element.id);
      });
    }

    _categoryRepository.delete(category.id);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<List<CategoryOjbModel>, Exception>> getCategories() async {
    final query = await _categoryRepository.getAll(
      p: CategoryOjbModel_.indexPos,
    );
    return Future.value(Result(data: query));
  }

  @override
  Future<Result<List<CategoryOjbModel>, Exception>>
      getCategoriesWithAccounts() {
    // TODO: implement getCategoriesWithAccounts
    throw UnimplementedError();
  }

  @override
  Future<Result<CategoryOjbModel, Exception>> getCategory(int id) async {
    final query = await _categoryRepository.get(id);
    return Future.value(Result(data: query));
  }

  @override
  Future<Result<CategoryOjbModel, Exception>> saveCategory(
      CategoryOjbModel category) {
    category.indexPos = _getNextIndexPos();
    _categoryRepository.box.put(category);
    return Future.value(Result(data: category));
  }

  @override
  Future<Result<bool, Exception>> updateCategory(CategoryOjbModel category) {
    _categoryRepository.update(category);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<bool, Exception>> updateAllCategory(
      List<CategoryOjbModel> category) {
    _categoryRepository.updateAll(category);
    return Future.value(Result(data: true));
  }

  int _getNextIndexPos() {
    final queryBuilder = _categoryRepository.box.query()
      ..order(CategoryOjbModel_.indexPos, flags: Order.descending);
    final query = queryBuilder.build();
    final highestIndexPos = query.property(CategoryOjbModel_.indexPos).max();
    query.close();
    return (highestIndexPos) + 1;
  }

  @override
  Future<Result<CategoryOjbModel, Exception>> findCategoryByName(
      String name) async {
    final query = _categoryRepository.box
        .query(
          CategoryOjbModel_.categoryName.equals(name),
        )
        .build()
        .find();

    if (query.isEmpty) {
      return Future.value(Result(data: CategoryOjbModel(categoryName: "")));
    }
    return Future.value(Result(data: query.first));
  }
}
