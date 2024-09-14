import 'dart:io';

import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UseBiometricLogin extends StatefulWidget {
  const UseBiometricLogin({super.key});

  @override
  State<UseBiometricLogin> createState() => _UseBiometricLoginState();
}

class _UseBiometricLoginState extends State<UseBiometricLogin> {
  bool isCanUseBiometric = false;
  bool isOpenUseBiometric = false;

  @override
  void initState() {
    super.initState();
    checkBiometric();
  }

  void changeBiometric(bool value) async {
    bool isAuth = await LocalAuthConfig.instance.authenticate();
    if (isAuth) {
      if (!value) {
        setState(() {
          isOpenUseBiometric = false;
        });
        SecureStorage.instance
            .save(SecureStorageKeys.isEnableLocalAuth.name, "false");
      } else {
        await SecureStorage.instance
            .save(SecureStorageKeys.isEnableLocalAuth.name, "true");
        setState(() {
          isOpenUseBiometric = true;
        });
      }
    }

    await LocalAuthConfig.instance.init();
  }

  void checkBiometric() async {
    String? enableLocalAuth = await SecureStorage.instance
        .read(SecureStorageKeys.isEnableLocalAuth.name);

    if (enableLocalAuth == "false" || enableLocalAuth == null) {
      setState(() {
        isOpenUseBiometric = false;
      });
    } else {
      setState(() {
        isOpenUseBiometric = true;
      });
    }

    bool canCheckBiometrics = LocalAuthConfig.instance.isAvailableBiometrics;

    setState(() {
      isCanUseBiometric = canCheckBiometrics;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isCanUseBiometric,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CardCustomWidget(
            padding: const EdgeInsets.all(0),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        langDefinition: SettingLangDef.khoaSinhTracHoc,
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    //switch
                    Row(
                      children: [
                        AppCustomSwitch(
                          value: isOpenUseBiometric,
                          onChanged: (value) {
                            changeBiometric(value);
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (Platform.isIOS)
                          SvgPicture.asset(
                            'assets/images/icons/face_id.svg',
                            width: 20.w,
                            height: 20.h,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        if (Platform.isAndroid)
                          Icon(
                            Icons.fingerprint_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24.sp,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
