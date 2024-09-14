import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/password_generator/views.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class PassGenScreen extends StatelessWidget {
  final bool? isFromForm;
  final Function(String)? onPasswordChanged;
  const PassGenScreen({super.key, this.isFromForm, this.onPasswordChanged});

  @override
  Widget build(BuildContext context) {
    return BaseView<PassGenViewModel>(
      onViewModelReady: (viewModel) {
        viewModel.generatePassword();
        viewModel.isFromForm = isFromForm ?? false;
        viewModel.onPasswordChanged = onPasswordChanged ?? ((_) {});
      },
      builder: (context, viewModel, _) {
        return ResponsiveLayout(
          mobileBody: MobileView(
            viewModel: viewModel,
          ),
          tabletBody: MobileView(
            viewModel: viewModel,
          ),
          desktopBody: MobileView(
            viewModel: viewModel,
          ),
        );
      },
    );
  }
}
