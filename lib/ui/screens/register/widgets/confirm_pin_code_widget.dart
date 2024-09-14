import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ConfirmPinCodeWidget extends StatefulWidget {
  final RegisterScreenViewModel viewModel;
  const ConfirmPinCodeWidget({super.key, required this.viewModel});

  @override
  State<ConfirmPinCodeWidget> createState() => _ConfirmPinCodeWidgetState();
}

class _ConfirmPinCodeWidgetState extends State<ConfirmPinCodeWidget> {
  var focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.onKeyEvent = (node, event) {
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        widget.viewModel.onSavePinCode();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getText(context, LocalAuthLangDef.xacNhanMaPin).toUpperCase(),
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 430),
          child: AppPinCodeFields(
            key: widget.viewModel.appPinCodeConfirmKey,
            formKey: widget.viewModel.formConfirmKey,
            autoFocus: true,
            focusNode: focusNode,
            validator: (value) {
              if (value!.length < 6) {
                return getText(context, LocalAuthLangDef.vuiLongNhapDayDuMaPin);
              }
              return null;
            },
            onCompleted: (value, state) {
              // widget.viewModel.onSavePinCode();
            },
            onChanged: (value) {
              widget.viewModel.pinCodeConfirm = value;
            },
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButtonWidget(
            borderRaidus: 100,
            width: 75.h,
            height: 75.h,
            onPressed: () {
              widget.viewModel.onSavePinCode();
            },
            text: "",
            child: Icon(Icons.check, size: 24.sp))
      ],
    );
  }
}
