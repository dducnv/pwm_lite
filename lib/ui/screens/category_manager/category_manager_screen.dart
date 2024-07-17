import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/category_manager/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/widgets.dart';

class CategoryManagerScreen extends StatelessWidget {
  const CategoryManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryManagerViewModel>(onViewModelReady: (viewModel) {
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
