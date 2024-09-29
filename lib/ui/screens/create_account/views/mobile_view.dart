import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens/create_account/components/create_form.dart';
import 'package:cyber_safe/ui/screens/create_account/extentions.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/services.dart';

class MobileView extends StatefulWidget {
  final CreateAccountViewModel viewModel;
  const MobileView({
    super.key,
    required this.viewModel,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with CreateAccountMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await widget.viewModel.handleAddAccount(context);
          },
          child: const Icon(Icons.check),
        ),
        appBar: AppbarCustom(
          title: getText(context, CreateAccountLangDif.taoTaiKhoan),
          onPressBack: () {
            Navigator.pop(context);
          },
        ),
        body: CreateForm(
          viewModel: widget.viewModel,
        ));
  }
}
