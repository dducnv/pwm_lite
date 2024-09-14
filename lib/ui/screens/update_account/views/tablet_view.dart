import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/update_account/extensions.dart';
import 'package:flutter/material.dart';

class TabletView extends StatefulWidget {
  final UpdateAccountViewModel viewModel;
  const TabletView({super.key, required this.viewModel});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> with UpdateAccountMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Account'),
      ),
      body: Container(),
    );
  }
}
