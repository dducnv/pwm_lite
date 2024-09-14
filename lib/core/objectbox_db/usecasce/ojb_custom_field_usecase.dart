import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/objectbox_db.dart';
import 'package:cyber_safe/core/utils.dart';

class OjbAccountCustomFieldUsecase implements AccountCustomFieldUsecase {
  final OjbRepository<AccountCustomFieldOjbModel> _repository;

  OjbAccountCustomFieldUsecase(this._repository);

  @override
  Future<bool> createAccountCustomField(
      AccountCustomFieldOjbModel accountCustomField) {
    // TODO: implement createAccountCustomField
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAccountCustomField() {
    // TODO: implement deleteAccountCustomField
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAccountCustomField(
      List<AccountCustomFieldOjbModel> accountCustomField) {
    _repository.insertAll(accountCustomField);
    return Future.value(true);
  }

  @override
  Future<bool> updateAccountCustomField(
      AccountCustomFieldOjbModel accountCustomField) {
    // TODO: implement updateAccountCustomField
    throw UnimplementedError();
  }

  @override
  Future<Result<List<AccountCustomFieldOjbModel>, Exception>>
      getAccountCustomField() async {
    final query = await _repository.getAll();
    return Future.value(Result(data: query));
  }
}
