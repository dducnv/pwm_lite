import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: DataShared.instance.isLoadding,
      builder: (context, value, child) {
        return ModalProgressHUD(
            inAsyncCall: value,
            progressIndicator: const ShowLoading(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 500) {
                  return mobileBody;
                } else if (constraints.maxWidth < 1100) {
                  return tabletBody;
                } else {
                  return desktopBody;
                }
              },
            ));
      },
    );
  }
}
