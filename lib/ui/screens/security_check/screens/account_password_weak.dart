import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class AccountPasswordWeak extends StatefulWidget {
  final SecurityCheckViewModel viewModel;
  const AccountPasswordWeak({super.key, required this.viewModel});

  @override
  State<AccountPasswordWeak> createState() => _AccountPasswordWeakState();
}

class _AccountPasswordWeakState extends State<AccountPasswordWeak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: getText(context, SecurityCheckLangDef.tongSoMatKhauYeu),
        onPressBack: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: ValueListenableBuilder(
            valueListenable: widget.viewModel.listCategoryPasswordWeak,
            builder: (context, listCategoryPasswordWeak, child) {
              return widget.viewModel.totalAccountPasswordWeak.value == 0
                  ? Center(
                      child: Image.asset(
                        "assets/images/exclamation-mark.png",
                        width: 60.w,
                        height: 60.h,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: ListView.builder(
                        itemCount: listCategoryPasswordWeak.length,
                        shrinkWrap: true,
                        itemBuilder: (context, parentIndex) {
                          return Visibility(
                            visible: listCategoryPasswordWeak[parentIndex]
                                .accounts
                                .isNotEmpty,
                            child: CardItem(
                              title:
                                  "${listCategoryPasswordWeak[parentIndex].categoryName} (${listCategoryPasswordWeak[parentIndex].accounts.length})",
                              items: listCategoryPasswordWeak[parentIndex]
                                  .accounts,
                              itemBuilder: (item, index) {
                                return AccountItemWidget(
                                  accountModel: item,
                                  isLastItem: index ==
                                      listCategoryPasswordWeak[parentIndex]
                                              .accounts
                                              .length -
                                          1,
                                  subIcon: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18.sp,
                                    ),
                                  ),
                                  onCallBackPop: () {
                                    widget.viewModel.init();
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
            },
          )),
    );
  }
}
