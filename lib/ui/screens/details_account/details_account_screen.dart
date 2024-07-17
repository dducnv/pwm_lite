import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/details_account/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class DetailsAccountScreen extends StatelessWidget {
  final int id;
  const DetailsAccountScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsAccountViewModel>(onViewModelReady: (viewModel) {
      viewModel.getDetailAccount(id);
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
