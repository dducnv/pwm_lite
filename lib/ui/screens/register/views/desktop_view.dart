import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/register/widgets.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatefulWidget {
  final RegisterScreenViewModel viewModel;

  const DesktopView({super.key, required this.viewModel});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
