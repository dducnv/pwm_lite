import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils/result.dart';

abstract class AccountUsecase {
  Future<Result<List<AccountOjbModel>, Exception>> getAccounts();
  Future<Result<AccountOjbModel, Exception>> getAccount(
    int uid,
  );
  Future<Result<bool, Exception>> saveAccount(AccountOjbModel account);
  Future<Result<bool, Exception>> deleteAccount(AccountOjbModel account);
  Future<Result<bool, Exception>> updateAccount(AccountOjbModel account);
  Future<Result<bool, Exception>> updatePassword(
    AccountOjbModel account,
    String newPassword,
  );

  //save all
  Future<Result<bool, Exception>> saveAll(List<AccountOjbModel> accounts);
  Future<Result<bool, Exception>> deleteAll(List<AccountOjbModel> accounts);
}
