import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/objectbox_db.dart';
import 'package:cyber_safe/core/utils/result.dart';

class OjbAccountUsecase extends AccountUsecase {
  final OjbRepository<AccountOjbModel> _accountRepository;

  final OjbRepository<AccountCustomFieldOjbModel> _accountCustomFieldRepository;

  final OjbRepository<TOTPOjbModel> _totpRepository;

  final OjbRepository<PasswordHistory> _passwordHistoryRepository;

  OjbAccountUsecase(this._accountRepository, this._accountCustomFieldRepository,
      this._totpRepository, this._passwordHistoryRepository);

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

    if (query.data?.totp.target != null) {
      _totpRepository.delete(query.data!.totp.target!.id);
    }

    if (query.data?.passwordHistories != null) {
      query.data?.passwordHistories.forEach((element) {
        _passwordHistoryRepository.delete(element.id);
      });
    }

    _accountRepository.delete(account.id);
    return Future.value(Result(data: true));
  }

  @override
  Future<Result<AccountOjbModel, Exception>> getAccount(int id) async {
    final query = await _accountRepository.get(id);
    if (query != null) {
      _autoDeletePasswordHistories(query);
    }
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

  void _autoDeletePasswordHistories(AccountOjbModel account) {
    if (account.passwordHistories.isEmpty) {
      return;
    }
    if (account.passwordHistories.length > 5) {
      account.passwordHistories
          .sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      account.passwordHistories.removeAt(0);
    }
  }

  @override
  Future<Result<bool, Exception>> addPasswordHistory(
      AccountOjbModel account, String oldPassword) {
    final passwordHistory =
        PasswordHistory(password: oldPassword, createdAt: DateTime.now());
    passwordHistory.account.target = account;
    _passwordHistoryRepository.box.put(passwordHistory);
    return Future.value(Result(data: true));
  }
}
