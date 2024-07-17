import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/security_check/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class SecurityCheckScreen extends StatelessWidget {
  const SecurityCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SecurityCheckViewModel>(onViewModelReady: (viewModel) {
      viewModel.init();
    }, builder: (context, viewModel, _) {
      return ResponsiveLayout(
        mobileBody: MobileView(
          viewModel: viewModel,
        ),
        tabletBody: MobileView(
          viewModel: viewModel,
        ),
        desktopBody: DesktopView(
          viewModel: viewModel,
        ),
      );
    });
  }
}
