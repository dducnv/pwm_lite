import 'package:cyber_safe/ui/screens/home/extensions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';

class DesktopView extends StatefulWidget {
  final HomeViewModel viewModel;
  const DesktopView({super.key, required this.viewModel});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Desktop View'),
          ],
        ),
      ),
    );
  }
}
