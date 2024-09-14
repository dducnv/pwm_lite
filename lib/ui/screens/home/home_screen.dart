import 'package:cyber_safe/ui/provider.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/home/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onViewModelReady: (viewModel) {
        viewModel.initData();
      },
      builder: (context, viewModel, _) {
        return UpgradeAlert(
          showIgnore: false,
          child: Consumer<RootPR>(
            builder: (context, rootPr, child) {
              return ModalProgressHUD(
                inAsyncCall: rootPr.requestUpdateVersionKey,
                progressIndicator: RequestUpdateVersionKey(
                  homeViewModel: viewModel,
                ),
                child: ResponsiveLayout(
                  mobileBody: MobileView(
                    viewModel: viewModel,
                  ),
                  tabletBody: MobileView(
                    viewModel: viewModel,
                  ),
                  desktopBody: DesktopView(
                    viewModel: viewModel,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
