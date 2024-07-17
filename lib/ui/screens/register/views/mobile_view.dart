import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/register/widgets.dart';
import 'package:flutter/material.dart';

class MobileView extends StatefulWidget {
  final RegisterScreenViewModel viewModel;
  const MobileView({super.key, required this.viewModel});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.viewModel.isChangePinCode
            ? AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
              )
            : null,
        body: PageView(
          controller: widget.viewModel.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CreatePinCodeWidget(viewModel: widget.viewModel),
            ConfirmPinCodeWidget(viewModel: widget.viewModel),
          ],
        ));
  }
}
