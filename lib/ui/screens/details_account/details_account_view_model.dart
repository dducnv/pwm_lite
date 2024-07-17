import 'dart:async';

import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base/base_view_model.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:flutter/material.dart';

class DetailsAccountViewModel extends BaseViewModel {
  final CategoryUsecase categoryUsecase;
  final AccountUsecase accountUsecase;

  DetailsAccountViewModel({
    required this.accountUsecase,
    required this.categoryUsecase,
  });
  ValueNotifier<AccountOjbModel> account =
      ValueNotifier(AccountOjbModel(title: ""));

  ValueNotifier<bool> isLoadding = ValueNotifier(false);

  ValueNotifier<bool> isEditNote = ValueNotifier(false);
  TextEditingController txtNote = TextEditingController();
  late int id;

  DataShared get dataShared => DataShared.instance;

  bool isUpdated = false;

  void getDetailAccount(int id) async {
    isLoadding.value = true;
    Result<AccountOjbModel, Exception> getAccount =
        await accountUsecase.getAccount(id);
    if (getAccount.isSuccess) {
      account.value = getAccount.data ?? AccountOjbModel(title: "");
      this.id = id;

      if (account.value.notes != "" && account.value.notes != null) {
        txtNote.text = decryptInfo(account.value.notes!);
      }
      Future.delayed(const Duration(milliseconds: 200), () {
        isLoadding.value = false;
      });
      setState(ViewState.busy);
    } else {
      customLogger(msg: "${getAccount.error}", typeLogger: TypeLogger.error);
    }
    setState(ViewState.idle);
  }

  void handleUpdateNote() async {
    setState(ViewState.busy);
    if (isEditNote.value == false) {
      isEditNote.value = true;
      setState(ViewState.idle);
      return;
    }
    if (account.value.notes == txtNote.text) {
      isEditNote.value = false;
      setState(ViewState.idle);
      return;
    }

    String noteEncrypted = txtNote.text != ""
        ? EncryptData.instance.encryptFernet(
            key: Env.infoEncryptKey,
            value: txtNote.text,
          )
        : "";
    account.value.notes = noteEncrypted;
    Result<bool, Exception> updateNote =
        await accountUsecase.updateAccount(account.value);
    if (updateNote.isSuccess) {
      customLogger(msg: "Update note success", typeLogger: TypeLogger.info);
      isEditNote.value = false;
    } else {
      customLogger(msg: "${updateNote.error}", typeLogger: TypeLogger.error);
    }
    setState(ViewState.idle);
  }

  Future<void> handleDeleteAccount({
    required BuildContext context,
    required AccountOjbModel accountModel,
  }) async {
    dataShared.isLoadding.value = true;
    Result<bool, Exception> result =
        await accountUsecase.deleteAccount(accountModel);
    if (result.isSuccess) {
      dataShared.getAccounts();
      dataShared.getCategories();
      dataShared.isLoadding.value = false;
    } else {
      dataShared.isLoadding.value = false;
      customLogger(
        msg: result.error.toString(),
        typeLogger: TypeLogger.error,
      );
    }
  }
}
