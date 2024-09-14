import 'package:cyber_safe/ui/screens/create_account/extentions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';

class TabletView extends StatefulWidget {
  final CreateAccountViewModel viewModel;
  const TabletView({
    super.key,
    required this.viewModel,
  });

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> with CreateAccountMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tablet View'),
      ),
    );
  }
}
