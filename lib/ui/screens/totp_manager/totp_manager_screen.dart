import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/totp_manager/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class TOTPManagerScreen extends StatelessWidget {
const TOTPManagerScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return  BaseView<TOTPViewModel>(
        onViewModelReady: (viewModel) {
        },
        builder: (context, viewModel, _) {
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