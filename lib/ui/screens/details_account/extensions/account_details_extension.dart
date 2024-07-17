import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions/details_account_lang_definiton.dart';
import 'package:cyber_safe/ui/resource/language/definitions/home_lang_difinition.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

mixin AccountDetailsMixin {}

extension AccountDetailsExtension on AccountDetailsMixin {
  Future<void> optionBottomSheet(
    BuildContext context, {
    required DetailsAccountViewModel viewModel,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.edit,
                    size: 24.sp,
                  ),
                  title: Text(getText(context, HomeLangDifinition.suaTaiKhoan),
                      style: titleHomeOptiomItemStyle),
                  onTap: () async {
                    if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                      showRequestUpdateVersionKey();
                      return;
                    }
                    Navigator.pop(context);
                    final statusUpdate = await Navigator.pushNamed(
                      context,
                      RoutePaths.updateAccountRoute,
                      arguments: {"id": viewModel.account.value.id},
                    );
                    if (statusUpdate == null) return;
                    if (statusUpdate == true) {
                      viewModel.isUpdated = true;
                      viewModel.getDetailAccount(viewModel.account.value.id);
                    }
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.delete,
                    size: 24.sp,
                  ),
                  title: Text(
                    getText(context, HomeLangDifinition.xoaTaiKhoan),
                    style: titleHomeOptiomItemStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          actionsPadding: const EdgeInsets.only(
                            bottom: 2,
                            right: 5,
                          ),
                          contentPadding: const EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          content: Text(getText(
                              context,
                              DetailsAccountLangDef
                                  .banCoChacChanMuonXoaTaiKhoanNay)),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                  getText(context, DetailsAccountLangDef.dong)),
                            ),
                            TextButton(
                              onPressed: () async {
                                await viewModel.handleDeleteAccount(
                                    context: context,
                                    accountModel: viewModel.account.value);
                                // ignore: use_build_context_synchronously
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  Navigator.pop(context);
                                  Navigator.of(context).pop("deleted");
                                });
                              },
                              child: Text(getText(
                                  context, DetailsAccountLangDef.xoaTaiKhoan)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> bottomSheetPasswordHistory(
      {required BuildContext context,
      required AccountOjbModel accountOjbModel}) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    getText(context, DetailsAccountLangDef.lichSuMatKhau),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: accountOjbModel.passwordHistories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final passwordHistory =
                        accountOjbModel.passwordHistories[index];
                    return ListTile(
                        title: Text(
                          decryptPassword(passwordHistory.password),
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          " ${passwordHistory.createdAtFromat}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            clipboardCustom(
                                context: context,
                                text:
                                    decryptPassword(passwordHistory.password));
                          },
                        ));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
