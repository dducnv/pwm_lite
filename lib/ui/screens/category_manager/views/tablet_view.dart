import 'package:cyber_safe/ui/screens/category_manager/extensions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';

class TabletView extends StatefulWidget {
  final CategoryManagerViewModel viewModel;
  const TabletView({
    super.key,
    required this.viewModel,
  });

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> with CategoryManagerMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tablet View'),
      ),
    );
  }
}
