import 'package:cyber_safe/ui/provider/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/setting/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingViewModel>(onViewModelReady: (viewModel) {
      viewModel.init();
      viewModel.isOpenAutoLock.value = context.read<RootPR>().isOpenAutoLock;
      viewModel.timeAutoLock.value = context.read<RootPR>().timeAutoLock;
    }, builder: (context, viewModel, _) {
      return ResponsiveLayout(
        mobileBody: MobileView(
          viewModel: viewModel,
        ),
        tabletBody: MobileView(
          viewModel: viewModel,
        ),
        desktopBody: MobileView(
          viewModel: viewModel,
        ),
      );
    });
  }
}
