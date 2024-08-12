import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeLangWidget extends StatelessWidget {
  final Function() onTap;
  final Locale locale;
  const ChangeLangWidget(
      {super.key, required this.onTap, required this.locale});

  @override
  Widget build(BuildContext context) {
    return CardCustomWidget(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getText(context, SettingLangDef.doiNgonNgu),
                    style: settingTitleItemStyle),
                const SizedBox(height: 4),
                Selector<RootPR, AppLanguage>(
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          AppLangsList()
                              .appLangs
                              .firstWhere((element) => element.code == value)
                              .name,
                          style: settingTitleItemStyle,
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 24.sp,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ],
                    );
                  },
                  selector: (context, provider) => provider.appLanguage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
