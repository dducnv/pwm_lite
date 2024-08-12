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
    final Size screenSize = MediaQuery.of(context).size;

    return ValueListenableBuilder(
      valueListenable: DataShared.instance.isLoadding,
      builder: (context, value, child) {
        return ModalProgressHUD(
          inAsyncCall: value,
          progressIndicator: const ShowLoading(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (screenSize.width < 400) {
                return mobileBody;
              } else if (screenSize.width < 900) {
                return tabletBody;
              } else {
                return desktopBody;
              }
            },
          ),
        );
      },
    );
  }
}
