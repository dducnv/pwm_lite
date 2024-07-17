import 'package:cyber_safe/ui/screens.dart';
import 'package:flutter/material.dart';

class TabletView extends StatefulWidget {
  final RegisterScreenViewModel viewModel;

  const TabletView({super.key, required this.viewModel});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
