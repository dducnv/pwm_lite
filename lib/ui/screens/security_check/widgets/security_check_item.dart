import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/widgets/card/card_custom_widget.dart';
import 'package:flutter/material.dart';

class SecurityCheckItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? subIcon;

  final int value;
  final Function()? onTap;
  const SecurityCheckItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.value,
      this.onTap,
      this.subIcon});

  @override
  Widget build(BuildContext context) {
    return CardCustomWidget(
      padding: const EdgeInsets.all(0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 24.sp,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        title,
                        style: settingTitleItemStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      value.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    subIcon != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Icon(
                              subIcon,
                              size: 18.sp,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
