import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class SamePasswordsView extends StatefulWidget {
  final SecurityCheckViewModel viewModel;
  const SamePasswordsView({super.key, required this.viewModel});

  @override
  State<SamePasswordsView> createState() => _SamePasswordsViewState();
}

class _SamePasswordsViewState extends State<SamePasswordsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: getText(context, SecurityCheckLangDef.tongSoMatKhauGiongNhau),
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
          valueListenable: widget.viewModel.listAccountSamePassword,
          builder: (context, listAccountSamePassword, child) {
            return listAccountSamePassword.isEmpty
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
                      itemCount: listAccountSamePassword.length,
                      shrinkWrap: true,
                      itemBuilder: (context, parentIndex) {
                        return CardItem(
                          title:
                              "${getText(context, SecurityCheckLangDef.tongSoTaiKhoan)}: ${listAccountSamePassword[parentIndex].length}",
                          items: listAccountSamePassword[parentIndex],
                          itemBuilder: (item, index) {
                            return AccountItemWidget(
                              accountModel: item,
                              isLastItem: index ==
                                  listAccountSamePassword[parentIndex].length -
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
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
