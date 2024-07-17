import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/widgets/button/custom_button_widget.dart';
import 'package:cyber_safe/ui/widgets/card/card_custom_widget.dart';
import 'package:cyber_safe/ui/widgets/otp_text_with_countdown/otp_text_with_countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

mixin TOTPManagerMixin {}

extension TOTPManagerExtensions on TOTPManagerMixin {
  Future<void> seeDetailTOTPBottomSheet(
    BuildContext context,
    AccountOjbModel totp,
  ) async {
    bool isDarkMode =
        Provider.of<RootPR>(context, listen: false).themeMode == ThemeMode.dark;
    Widget accountIcon() {
      if (totp.icon == "default") {
        return Text(totp.title[0].toUpperCase());
      }
      final branchLogo = allBranchLogos.firstWhere(
        (element) => element.branchLogoSlug == totp.icon,
        orElse: () => BranchLogo(
          [],
          "default",
        ),
      );
      if (branchLogo.branchName == null) {
        return Text(totp.title[0].toUpperCase());
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          width: 50.w,
          height: 50.h,
          isDarkMode
              ? branchLogo.branchLogoPathDarkMode!
              : branchLogo.branchLogoPathLightMode!,
        ),
      );
    }

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: ColoredBox(
                        color: Colors.grey.withOpacity(0.2),
                        child: Center(child: accountIcon()),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  decryptInfo(totp.title),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  decryptInfo(totp.email ?? ""),
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child: CardCustomWidget(
                      child: OtpTextWithCountdown(
                        keySecret:
                            decryptTOTPKey(totp.totp.target?.secretKey ?? ""),
                      ),
                    )),
                    const SizedBox(width: 10),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          clipboardCustom(
                            context: context,
                            text: decryptTOTPKey(
                              totp.totp.target?.secretKey ?? "",
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.copy,
                          size: 20.sp,
                        ))
                  ],
                ),
                const SizedBox(height: 10),
                CustomButtonWidget(
                    kMargin: 0,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.detailsAccountRoute,
                        arguments: {"id": totp.id},
                      ).then((value) {
                        if (value != null && value == "delete") {
                          Navigator.pop(context);
                        }
                      });
                    },
                    text: getText(context, HomeLangDifinition.chiTietTaiKhoan))
              ],
            ),
          ),
        );
      },
    );
  }
}
