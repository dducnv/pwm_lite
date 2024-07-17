import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';

class TabletView extends StatelessWidget {
  final DetailsAccountViewModel viewModel;
  const TabletView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tablet View'),
      ),
    );
  }
}
