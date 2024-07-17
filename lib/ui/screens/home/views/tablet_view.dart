import 'package:cyber_safe/ui/screens/home/extensions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';

class TabletView extends StatefulWidget {
  final HomeViewModel viewModel;
  const TabletView({super.key, required this.viewModel});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () async {},
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: const Center(
        child: Column(
          children: [
            Text('Tablet View'),
          ],
        ),
      ),
    );
  }
}
