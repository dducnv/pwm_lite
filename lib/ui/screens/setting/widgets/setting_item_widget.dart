import 'package:cyber_safe/core/utils/scale_utils.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingItemWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final IconData? icon;
  final double? titleWidth;
  final Widget? suffix;
  final EdgeInsetsGeometry? padding;
  const SettingItemWidget(
      {super.key,
      this.onTap,
      required this.title,
      this.icon,
      this.titleWidth,
      this.suffix,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return CardCustomWidget(
        padding: const EdgeInsets.all(0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:
                        titleWidth ?? MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      title,
                      style: settingTitleItemStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  icon != null
                      ? Icon(
                          icon,
                          size: 24.sp,
                        )
                      : suffix ?? const SizedBox(),

                  //switch
                ],
              ),
            ),
          ),
        ));
  }
}
