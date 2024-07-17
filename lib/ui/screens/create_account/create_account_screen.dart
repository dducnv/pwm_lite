import 'package:cyber_safe/core/domains.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/create_account/views.dart';
import 'package:cyber_safe/ui/widgets.dart';

class CreateAccountScreen extends StatelessWidget {
  final CategoryOjbModel categoryModel;
  const CreateAccountScreen({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateAccountViewModel>(onViewModelReady: (viewModel) {
      viewModel.initData();
      viewModel.categorySelected.value = categoryModel;
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
