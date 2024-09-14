import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';

abstract class AccountCustomFieldUsecase {
  Future<Result<List<AccountCustomFieldOjbModel>, Exception>>
      getAccountCustomField();

  Future<bool> createAccountCustomField(
      AccountCustomFieldOjbModel accountCustomField);

  Future<bool> updateAccountCustomField(
      AccountCustomFieldOjbModel accountCustomField);

  Future<bool> deleteAccountCustomField();

  //save multiple account custom field

  Future<bool> saveAccountCustomField(
      List<AccountCustomFieldOjbModel> accountCustomField);
}
