import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/totp_manager/extensions.dart';
import 'package:cyber_safe/ui/screens/totp_manager/widgets.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class MobileView extends StatefulWidget {
  final TOTPViewModel viewModel;
  const MobileView({super.key, required this.viewModel});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with TOTPManagerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarCustom(
          title: getText(context, HomeLangDifinition.quanLyTotp),
          onPressBack: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ValueListenableBuilder(
            builder: (context, value, child) {
              return value.isEmpty
                  ? Center(
                      child: Image.asset(
                        "assets/images/exclamation-mark.png",
                        width: 60.w,
                        height: 60.h,
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final totp =
                            widget.viewModel.dataShared.totpList.value[index];
                        return TotpItem(
                            onTap: () {
                              seeDetailTOTPBottomSheet(context, totp);
                            },
                            icon: totp.icon ?? "",
                            secretKey: decryptTOTPKey(
                                totp.totp.target?.secretKey ?? ""),
                            title: decryptInfo(totp.title),
                            email: decryptInfo(totp.email ?? ""));
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount:
                          widget.viewModel.dataShared.totpList.value.length);
            },
            valueListenable: widget.viewModel.dataShared.totpList,
          ),
        ));
  }
}
