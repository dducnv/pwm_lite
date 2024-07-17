import 'dart:async';

import 'package:cyber_safe/core/services.dart';
import 'package:cyber_safe/ui/provider/data_shared.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider/root_provider.dart';
import 'package:timezone/timezone.dart' as timezone;
import 'package:url_launcher/url_launcher.dart';

export './utils/dialog_content.dart';
export './utils/encrypt_utils.dart';
export './utils/local_auth_utils.dart';
export './utils/logger.dart';
export './utils/secure_storage.dart';
export './utils/theme_provider.dart';
export './utils/global_keys.dart';
export './utils/result.dart';
export './utils/base32.dart';
export './utils/encodings_base32.dart';
export './utils/type_text_field.dart';
export './utils/refetch_totp.dart';
export './utils/secure_application_util.dart';
export './utils/scale_utils.dart';

typedef JsonToModelHandle<T> = T Function(Map<String, dynamic>);
typedef TypeToTypeHandle<X, Y> = Y Function(X);

DataShared get _dataShared => DataShared.instance;

T? tryCast<T>(dynamic x) {
  if (x == null || x is! T || x == "") {
    return null;
  }
  try {
    return x;
  } catch (e) {
    customLogger(
        msg:
            "CastError when trying to cast $x to $T!. Type x is ${x.runtimeType}",
        typeLogger: TypeLogger.error);

    return null;
  }
}

String decryptInfo(String info) {
  try {
    if (info.isEmpty) return '';
    String decryptResult = EncryptData.instance.decryptFernet(
      key: _dataShared.isUpdatedVersionEncryptKey.value
          ? Env.oldInfoEncryptKey
          : Env.infoEncryptKey,
      value: info,
    );
    return decryptResult;
  } catch (e) {
    customLogger(msg: "decryptInfo: $e", typeLogger: TypeLogger.error);
    return "error decrypting info";
  }
}

String decryptPassword(String password) {
  if (password.isEmpty) return '';
  try {
    String decryptResult = EncryptData.instance.decryptFernet(
      key: _dataShared.isUpdatedVersionEncryptKey.value
          ? Env.oldPasswordEncryptKey
          : Env.passwordEncryptKey,
      value: password,
    );
    return decryptResult;
  } catch (e) {
    customLogger(msg: "decryptPassword: $e", typeLogger: TypeLogger.error);
    return "error decrypting password";
  }
}

String decryptTOTPKey(String totpKey) {
  try {
    if (totpKey.isEmpty) return '';
    String decryptResult = EncryptData.instance.decryptFernet(
      key: _dataShared.isUpdatedVersionEncryptKey.value
          ? Env.oldTotpEncryptKey
          : Env.totpEncryptKey,
      value: totpKey,
    );
    return decryptResult;
  } catch (e) {
    customLogger(msg: "decryptTOTPKey: $e", typeLogger: TypeLogger.error);
    return "";
  }
}

String decriptPinCode(String pinCode) {
  try {
    if (pinCode.isEmpty) return '';
    String decryptResult = EncryptData.instance.decryptFernet(
      key: _dataShared.isUpdatedVersionEncryptKey.value
          ? Env.oldPinCodeKeyEncrypt
          : Env.pinCodeKeyEncrypt,
      value: pinCode,
    );
    return decryptResult;
  } catch (e) {
    customLogger(msg: "decriptPincode $e", typeLogger: TypeLogger.error);
    return "";
  }
}

Future<bool> checkLocalAuth() async {
  String? enableLocalAuth = await SecureStorage.instance
      .read(SecureStorageKeys.isEnableLocalAuth.name);

  if (enableLocalAuth == "false") {
    return false;
  }

  bool canCheckBiometrics = await LocalAuthConfig.instance.canCheckBiometrics;
  if (!canCheckBiometrics) {
    return false;
  }

  bool isAvailableBiometrics = LocalAuthConfig.instance.isAvailableBiometrics;

  if (!isAvailableBiometrics) {
    return false;
  }

  bool authenticated = await LocalAuthConfig.instance.authenticate();

  return authenticated;
}

Future<bool> verifyPinCode({
  required String pinCodeEntered,
}) async {
  try {
    if (pinCodeEntered.isEmpty) {
      return false;
    }

    String? pinCodeEncrypted =
        await SecureStorage.instance.read(SecureStorageKeys.pinCode.name);
    if (pinCodeEncrypted == null) {
      return false;
    }

    String pinCode = decriptPinCode(pinCodeEncrypted);

    if (pinCode.isEmpty) {
      return false;
    }

    return pinCode == pinCodeEntered;
  } catch (e) {
    customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
  }

  return false;
}

String getText(BuildContext context, Enum key) {
  return context.read<RootPR>().languageMap.containsKey(key)
      ? context.read<RootPR>().languageMap[key]
      : 'Lỗi ngôn ngữ';
}

Future<void> checkIsRegister() async {
  String? pinCodeEncrypted =
      await SecureStorage.instance.read(SecureStorageKeys.pinCode.name);

  if (pinCodeEncrypted != null) {
    Navigator.of(GlobalKeys.appRootNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(RoutePaths.localAuthRoute, (route) => false);
  } else {
    Navigator.of(GlobalKeys.appRootNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(RoutePaths.registerRoute, (route) => false);
  }
}

String generateTOTPCode({
  required String keySecret,
}) {
  if (keySecret.isEmpty) {
    return "--- ---";
  }
  final now = DateTime.now();
  final pacificTimeZone = timezone.getLocation('America/Los_Angeles');
  final date = timezone.TZDateTime.from(now, pacificTimeZone);
  return OTPCustom.generateTOTPCodeString(
    keySecret,
    date.millisecondsSinceEpoch,
    algorithm: Algorithm.SHA1,
    isGoogle: true,
  );
}

Future<void> showRequestUpdateVersionKey() async {
  return showDialog(
      context: GlobalKeys.appRootNavigatorKey.currentContext!,
      builder: (_) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.all(16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getText(GlobalKeys.appRootNavigatorKey.currentContext!,
                    SecurityCheckLangDef.thongBaoYeuCauCapNhat),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              CustomButtonWidget(
                borderRaidus: 100,
                height: 44,
                onPressed: () {
                  Navigator.of(GlobalKeys.appRootNavigatorKey.currentContext!)
                      .pop();
                },
                text: getText(GlobalKeys.appRootNavigatorKey.currentContext!,
                    SecurityCheckLangDef.daHieu),
              ),
            ],
          ),
        );
      });
}

void openUrl(
  String link, {
  LaunchMode? mode,
}) async {
  if (await canLaunchUrl(Uri.parse(link))) {
    await launchUrl(
      Uri.parse(link),
      mode: mode ?? LaunchMode.externalApplication,
    );
  } else {
    print('Could not launch $link');
  }
}

Future<void> clipboardCustom({
  required BuildContext context,
  required String text,
}) async {
  await Clipboard.setData(
    ClipboardData(text: text),
  ).then(
    (value) {
      showToast(
        getText(context, HomeLangDifinition.saoChepThanhCong),
        context: context,
        backgroundColor: Theme.of(context).colorScheme.primary,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      );
    },
  );
}
