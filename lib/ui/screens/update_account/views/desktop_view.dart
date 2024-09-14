import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/update_account/extensions.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatefulWidget {
  final UpdateAccountViewModel viewModel;
  const DesktopView({super.key, required this.viewModel});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> with UpdateAccountMixin {
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
