import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/provider/data_shared.dart';
import 'package:flutter/material.dart';

class SecurityCheckViewModel extends BaseViewModel {
  final AccountUsecase accountUsecase;
  final CategoryUsecase categoryUsecase;

  DataShared get dataShared => DataShared.instance;

  SecurityCheckViewModel(
      {required this.accountUsecase, required this.categoryUsecase});

  ValueNotifier<int> totalAccount = ValueNotifier(0);
  ValueNotifier<int> totalAccountPasswordWeak = ValueNotifier(0);
  ValueNotifier<int> totalAccountPasswordStrong = ValueNotifier(0);

  ValueNotifier<List<CategoryOjbModel>> listCategoryPasswordWeak =
      ValueNotifier([]);

  ValueNotifier<List<List<AccountOjbModel>>> listAccountSamePassword =
      ValueNotifier([]);

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%&*()?£\-_=]).{12,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void init() {
    totalAccount.value = dataShared.accountList.value.length;
    listAccountSamePassword.value.clear();
    listCategoryPasswordWeak.value.clear();

    getAccountSamePassword(
      dataShared.accountList.value,
    );
    getAccountPasswordWeak(
      dataShared.categoriesList.value,
    );
    getTotalPasswordStrong();
  }

  Future<void> getAccount() async {}

  void getAccountPasswordWeak(
    List<CategoryOjbModel> categories,
  ) {
    totalAccountPasswordWeak.value = dataShared.accountList.value
        .where(
            (element) => !validateStructure(decryptPassword(element.password!)))
        .toList()
        .length;
    listCategoryPasswordWeak.value = categories.map((e) {
      final accounts = e.accounts
          .where((element) =>
              validateStructure(decryptPassword(element.password!)) == false)
          .toList();
      e.accounts.clear();
      e.accounts.addAll(accounts);
      return e;
    }).toList();
  }

  void getTotalPasswordStrong() {
    totalAccountPasswordStrong.value = dataShared.accountList.value
        .where(
            (element) => validateStructure(decryptPassword(element.password!)))
        .toList()
        .length;
  }

  void getAccountSamePassword(List<AccountOjbModel> listAccount) {
    var mapAccountSamePassword = <String, List<AccountOjbModel>>{};

    for (var account in listAccount) {
      if (account.password != null && account.password!.isNotEmpty) {
        var decodedPassword = decryptPassword(account.password!);
        mapAccountSamePassword.putIfAbsent(decodedPassword, () => []);
        mapAccountSamePassword[decodedPassword]!.add(account);
      }
    }

    listAccountSamePassword.value = mapAccountSamePassword.values
        .where((accounts) => accounts.length > 1)
        .toList();
  }
}
