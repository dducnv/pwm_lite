import 'dart:async';

import 'package:cyber_safe/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppPinCodeFields extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final Function(String, AppPinCodeFieldsState state) onCompleted;
  final Function(String) onChanged;
  final TextEditingController? textEditingController;
  final Key formKey;
  final bool? autoFocus;
  final FocusNode? focusNode;

  const AppPinCodeFields({
    super.key,
    required this.validator,
    required this.onCompleted,
    required this.onChanged,
    this.textEditingController,
    required this.formKey,
    this.autoFocus,
    this.focusNode,
  });

  @override
  State<AppPinCodeFields> createState() => AppPinCodeFieldsState();
}

class AppPinCodeFieldsState extends State<AppPinCodeFields> {
  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void triggerErrorAnimation() {
    widget.textEditingController?.clear();
    widget.focusNode?.requestFocus();
    errorController.add(ErrorAnimationType.shake);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 50,
        ),
        child: PinCodeTextField(
          appContext: context,
          focusNode: widget.focusNode,
          pastedTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          autoFocus: widget.autoFocus ?? false,
          obscureText: true,
          obscuringCharacter: '*',
          blinkWhenObscuring: false,
          showCursor: true,
          animationType: AnimationType.fade,
          validator: widget.validator,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 60,
              fieldWidth: 40,
              borderWidth: 10,
              inactiveFillColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              selectedColor: Theme.of(context).colorScheme.primary,
              selectedFillColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              activeFillColor: Theme.of(context).colorScheme.surface,
              activeColor: Theme.of(context).colorScheme.primary),
          cursorColor: Theme.of(context).colorScheme.primary,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: widget.textEditingController,
          keyboardType: TextInputType.number,
          errorTextMargin: const EdgeInsets.only(top: 10),
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          onCompleted: (v) {
            widget.onCompleted(v, this);
          },
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
