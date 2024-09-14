import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens/create_account/components/create_form.dart';
import 'package:cyber_safe/ui/screens/create_account/extentions.dart';
import 'package:cyber_safe/ui/widgets.dart';
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
    return Scaffold(
        appBar: AppbarCustom(
          title: getText(context, CreateAccountLangDif.taoTaiKhoan),
          onPressBack: () {
            Navigator.pop(context);
          },
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async {
                await widget.viewModel.handleAddAccount(context);
              },
            ),
          ],
        ),
        body: CreateForm(
          viewModel: widget.viewModel,
        ));
  }
}
