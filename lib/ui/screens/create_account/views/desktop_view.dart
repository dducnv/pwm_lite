import 'package:cyber_safe/ui/screens/create_account/extentions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';

class DesktopView extends StatefulWidget {
  final CreateAccountViewModel viewModel;
  const DesktopView({super.key, required this.viewModel});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> with CreateAccountMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Desktop View'),
      ),
    );
  }
}
