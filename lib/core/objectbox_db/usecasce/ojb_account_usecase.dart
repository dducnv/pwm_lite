import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/objectbox_db.dart';
import 'package:cyber_safe/core/utils/result.dart';

class OjbAccountUsecase extends AccountUsecase {
  final OjbRepository<AccountOjbModel> _accountRepository;

  final OjbRepository<AccountCustomFieldOjbModel> _accountCustomFieldRepository;

  OjbAccountUsecase(
      this._accountRepository, this._accountCustomFieldRepository);

  @override
  Future<Result<bool, Exception>> deleteAccount(AccountOjbModel account) async {
    Result<AccountOjbModel, Exception> query = await getAccount(account.id);
    if (query.data == null) {
      return Future.value(Result(data: false));
    }

    if (query.data?.customFields != null) {
      query.data?.customFields.forEach((element) {
        _accountCustomFieldRepository.delete(element.id);
      });
    }
    _accountRepository.delete(account.id);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<AccountOjbModel, Exception>> getAccount(int id) async {
    final query = await _accountRepository.get(id);
    return Future.value(Result(data: query));
  }

  @override
  Future<Result<List<AccountOjbModel>, Exception>> getAccounts() async {
    final query = await _accountRepository.getAll();
    return Future.value(Result(data: query));
  }

  @override
  Future<Result<bool, Exception>> saveAccount(AccountOjbModel account) {
    _accountRepository.box.put(account);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<bool, Exception>> updateAccount(AccountOjbModel account) {
    _accountRepository.update(account);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<bool, Exception>> saveAll(List<AccountOjbModel> accounts) {
    _accountRepository.box.putMany(accounts);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<bool, Exception>> updatePassword(
      AccountOjbModel account, String newPassword) {
    account.password = newPassword;
    account.passwordUpdatedAt = DateTime.now();
    _accountRepository.update(account);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<bool, Exception>> deleteAll(List<AccountOjbModel> accounts) {
    for (var account in accounts) {
      deleteAccount(account);
    }
    return Future.value(Result(data: true));
  }
}
