import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/widgets.dart';

class SetThemeModeWidget extends StatelessWidget {
  const SetThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardCustomWidget(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: ValueListenableBuilder<ThemeMode>(
            valueListenable: ValueNotifier<ThemeMode>(
                Provider.of<RootPR>(context, listen: true).themeMode),
            builder: (_, value, __) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (value == ThemeMode.dark) {
                      Provider.of<RootPR>(context, listen: false)
                          .setModeTheme(ThemeMode.light);
                    } else if (value == ThemeMode.light) {
                      Provider.of<RootPR>(context, listen: false)
                          .setModeTheme(ThemeMode.dark);
                    }
                    HapticFeedback.mediumImpact();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getText(context, SettingLangDef.tuyChinhGiaoDien),
                          style: settingTitleItemStyle,
                        ),
                        SizedBox(
                          child: value == ThemeMode.dark
                              ? Icon(
                                  Icons.light_mode,
                                  size: 24.sp,
                                )
                              : Icon(Icons.dark_mode, size: 24.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
