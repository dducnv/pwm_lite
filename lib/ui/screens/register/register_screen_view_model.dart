import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/base.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class RegisterScreenViewModel extends BaseViewModel {
  PageController pageController = PageController();

  final GlobalKey<AppPinCodeFieldsState> appPinCodeCreateKey =
      GlobalKey<AppPinCodeFieldsState>();
  final GlobalKey<AppPinCodeFieldsState> appPinCodeConfirmKey =
      GlobalKey<AppPinCodeFieldsState>();

  final GlobalKey<FormState> formCreateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formConfirmKey = GlobalKey<FormState>();

  String pinCodeCreate = "";
  String pinCodeConfirm = "";

  bool isChangePinCode = false;

  void navigateToConfirmPinCode() {
    formCreateKey.currentState!.validate();
    if (pinCodeCreate.length == 6) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      appPinCodeCreateKey.currentState!.triggerErrorAnimation();
    }
  }

  Future<void> onSavePinCode() async {
    if (pinCodeConfirm.length == 6) {
      if (pinCodeCreate == pinCodeConfirm) {
        try {
          String codeEncrypted = EncryptData.instance.encryptFernet(
            key: Env.pinCodeKeyEncrypt,
            value: pinCodeConfirm,
          );

          await SecureStorage.instance
              .save(SecureStorageKeys.pinCode.name, codeEncrypted);

              if(isChangePinCode){
                 showToast(
          getText(GlobalKeys.appRootNavigatorKey.currentContext!,
              SettingLangDef.doiMaPinThanhCong),
          context: GlobalKeys.appRootNavigatorKey.currentContext!,
          animation: StyledToastAnimation.slideFromTop,
        );
              }

          Navigator.of(GlobalKeys.appRootNavigatorKey.currentContext!)
              .pushNamedAndRemoveUntil(
                  RoutePaths.localAuthRoute, (route) => false);
        } catch (e) {
          customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
        }
      } else {
        pinCodeConfirm = "";
        pinCodeCreate = "";
        appPinCodeConfirmKey.currentState!.triggerErrorAnimation();
        Future.delayed(const Duration(milliseconds: 500), () {
          pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        });
      }
    } else {
      appPinCodeConfirmKey.currentState!.triggerErrorAnimation();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
