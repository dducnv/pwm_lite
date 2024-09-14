import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalAuthViewModel extends BaseViewModel {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  bool isVeryfiExportBackup = false;
  bool isPinFileImport = false;
  Function? onCallBack;
  Function(TextEditingController controller, GlobalKey<AppPinCodeFieldsState> appPinCodeKey)?
      onCallBackWithPin;
  final GlobalKey<AppPinCodeFieldsState> appPinCodeKey =
      GlobalKey<AppPinCodeFieldsState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> init({
    bool? isVeryfiExportBackup,
    Function? onCallBack,
    bool? isPinFileImport,
    Function(TextEditingController controller, GlobalKey<AppPinCodeFieldsState> appPinCodeKey)?
        onCallBackWithPin,
  }) async {
    this.isVeryfiExportBackup = isVeryfiExportBackup ?? false;
    this.isPinFileImport = isPinFileImport ?? false;
    this.onCallBackWithPin = onCallBackWithPin;
    this.onCallBack = onCallBack;
    if (LocalAuthConfig.instance.isAvailableBiometrics &&
        LocalAuthConfig.instance.isOpenUseBiometric &&
        this.isPinFileImport == false) {
      bool isAuth = await checkLocalAuth();
      if (isAuth) {
        if (this.isVeryfiExportBackup) {
          onCallBack?.call();
          return;
        }
        navigatorToHome();
      } else {
        Future.delayed(const Duration(milliseconds: 250), () {
          focusNode.requestFocus();
        });
      }
    } else {
      Future.delayed(const Duration(milliseconds: 250), () {
        focusNode.requestFocus();
      });
    }
  }

  Future<void> onLogin() async {
    formKey.currentState!.validate();
    String pinCode = textEditingController.text;
    if (pinCode.length == 6) {
      if (isPinFileImport) {
        onCallBackWithPin?.call(textEditingController, appPinCodeKey);
        return;
      }

      bool verify = await verifyPinCode(pinCodeEntered: pinCode);
      if (!verify) {
        appPinCodeKey.currentState!.triggerErrorAnimation();
        textEditingController.clear();
        Future.delayed(Duration.zero, () {
          focusNode.requestFocus();
        });
        return;
      }
      if (isVeryfiExportBackup) {
        onCallBack?.call();
        return;
      }
      navigatorToHome();
    } else {
      appPinCodeKey.currentState!.triggerErrorAnimation();
    }
  }

  void onBiometric() async {
    bool isAuth = await checkLocalAuth();
    if (isAuth) {
      navigatorToHome();
    }
  }

  void navigatorToHome() {
    GlobalKeys.appRootNavigatorKey.currentContext!
        .read<RootPR>()
        .initializeTimer();
    Navigator.of(GlobalKeys.appRootNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(RoutePaths.homeRoute, (route) => false);
  }
}
