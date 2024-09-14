import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/update_account/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class UpdateAccountScreen extends StatelessWidget {
  final int id;
  const UpdateAccountScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BaseView<UpdateAccountViewModel>(onViewModelReady: (viewModel) {
      viewModel.getDetailAccount(id);
      viewModel.initData();
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
