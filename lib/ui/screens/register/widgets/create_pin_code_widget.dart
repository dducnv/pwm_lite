import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';

class CreatePinCodeWidget extends StatefulWidget {
  final RegisterScreenViewModel viewModel;
  const CreatePinCodeWidget({super.key, required this.viewModel});

  @override
  State<CreatePinCodeWidget> createState() => _CreatePinCodeWidgetState();
}

class _CreatePinCodeWidgetState extends State<CreatePinCodeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.viewModel.isChangePinCode
              ? getText(context, LocalAuthLangDef.nhapMaPinMoi).toUpperCase()
              : getText(context, LocalAuthLangDef.taoMaPin).toUpperCase(),
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
            key: widget.viewModel.appPinCodeCreateKey,
            formKey: widget.viewModel.formCreateKey,
            autoFocus: true,
            validator: (value) {
              if (value!.length < 6) {
                return getText(context, LocalAuthLangDef.vuiLongNhapDayDuMaPin);
              }
              return null;
            },
            onCompleted: (value, state) {
              // widget.viewModel.onSavePinCode();
            },
            onEnter: () {
              widget.viewModel.navigateToConfirmPinCode();
            },
            onChanged: (value) {
              widget.viewModel.pinCodeCreate = value;
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
              widget.viewModel.navigateToConfirmPinCode();
              // conditions for validating
            },
            text: "",
            child: Icon(
              Icons.arrow_forward,
              size: 24.sp,
            ))
      ],
    );
  }
}
