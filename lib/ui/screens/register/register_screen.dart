import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/register/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
 final bool? isChangePinCode;
  const RegisterScreen({super.key,  this.isChangePinCode});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterScreenViewModel>(
        onViewModelReady: (viewModel) {
          viewModel.isChangePinCode = widget.isChangePinCode ?? false;
        },
        builder: (context, viewModel, _) {
          return ResponsiveLayout(
            mobileBody: MobileView(
              viewModel: viewModel,
            ),
            tabletBody: MobileView(
              viewModel: viewModel,
            ),
            desktopBody: DesktopView(
              viewModel: viewModel,
            ),
          );
        });
  }
}
