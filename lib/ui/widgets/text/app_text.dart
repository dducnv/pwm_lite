import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cyber_safe/ui/provider.dart';

class AppText extends StatelessWidget {
  final Enum langDefinition;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final TextScaler? textScaler;
  final int? maxLines;
  const AppText(
      {super.key,
      required this.langDefinition,
      this.textStyle,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.textScaler});

  @override
  Widget build(BuildContext context) {
    return Consumer<RootPR>(builder: (context, provider, child) {
      return Text(
        provider.languageMap.containsKey(langDefinition)
            ? provider.languageMap[langDefinition]
            : "Lỗi ngôn ngữ!",
        style: textStyle,
      );
    });
  }
}
