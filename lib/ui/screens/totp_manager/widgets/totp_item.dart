import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/brand_logo.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TotpItem extends StatefulWidget {
  final String secretKey;
  final String icon;
  final String title;
  final String email;
  final Function() onTap;

  const TotpItem(
      {super.key,
      required this.secretKey,
      required this.title,
      required this.email,
      required this.icon,
      required this.onTap});

  @override
  State<TotpItem> createState() => _TotpItemState();
}

class _TotpItemState extends State<TotpItem> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<RootPR>(context, listen: false).themeMode == ThemeMode.dark;
    Widget accountIcon() {
      if (widget.icon == "default") {
        return Text(widget.title[0].toUpperCase());
      }
      final branchLogo = allBranchLogos.firstWhere(
        (element) => element.branchLogoSlug == widget.icon,
        orElse: () => BranchLogo(
          [],
          "default",
        ),
      );
      if (branchLogo.branchName == null) {
        return Text(widget.title[0].toUpperCase());
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

    return CardCustomWidget(
      padding: const EdgeInsets.all(0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.onTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
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
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          if (widget.email.isNotEmpty)
                            Text(
                              widget.email,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      clipboardCustom(
                        context: context,
                        text: generateTOTPCode(keySecret: widget.secretKey),
                      );
                    },
                    icon: Icon(
                      Icons.copy,
                      size: 20.sp,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
