import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onPressBack;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  const AppbarCustom(
      {super.key, required this.title, required this.onPressBack, this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      title: Text(
        title,
        style: appbarTitleStyle,
      ),
      actions: actions,
    );
  }
}
