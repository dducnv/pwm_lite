import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/env.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/screens/onboarding/extensions.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final ValueNotifier<bool> isDegreed = ValueNotifier<bool>(false);

  DataShared get dataShared => DataShared.instance;

  @override
  void initState() {
    super.initState();
    initialization();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: <SystemUiOverlay>[
          SystemUiOverlay.bottom,
          SystemUiOverlay.top,
        ]);
  }

  void initialization() async {
    String? isFistTime =
        await SecureStorage.instance.read(SecureStorageKeys.fistOpenApp.name);
    final versionEncriptKey = await SecureStorage.instance
            .read(SecureStorageKeys.versionEncryptKey.name) ??
        "";
    final pinCode =
        await SecureStorage.instance.read(SecureStorageKeys.pinCode.name);
    if (versionEncriptKey.isEmpty || pinCode == null) {
      await SecureStorage.instance
          .save(SecureStorageKeys.versionEncryptKey.name, Env.versionKey);
    } else {
      if (versionEncriptKey != Env.versionKey) {
        dataShared.isUpdatedVersionEncryptKey.value = true;
      }
    }
    await Future.delayed(const Duration(milliseconds: 500), () {
      if (isFistTime != null) {
        checkIsRegister();
      } else {
        FlutterNativeSplash.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.secondaryContainer,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            buildBackground(width),
            buildContent(theme),
            buildBottomSection(theme),
          ],
        ),
      ),
    );
  }

  Positioned buildBackground(double width) {
    return Positioned(
      top: 0,
      left: 0,
      child: SvgPicture.asset(
        'assets/images/onboarding_bg.svg',
        fit: BoxFit.cover,
        width: width,
      ),
    );
  }

  Positioned buildContent(ThemeData theme) {
    return Positioned(
      top: 70,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildLogo(theme),
          const SizedBox(height: 20),
          buildWelcomeText(theme),
          buildAnimation(),
        ],
      ),
    );
  }

  Widget buildLogo(ThemeData theme) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/images/app_logo.png',
          width: 100.w,
          height: 100.h,
        ),
      ),
    );
  }

  Widget buildWelcomeText(ThemeData theme) {
    return Column(
      children: [
        AppText(
          langDefinition: HomeLangDifinition.chaoMungDenVoi,
          textStyle: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'CyberSafe',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildAnimation() {
    return Lottie.asset(
      'assets/animations/onboarding.json',
      width: 250.w,
      height: 250.h,
      fit: BoxFit.contain,
      frameRate: FrameRate.max,
    );
  }

  Positioned buildBottomSection(ThemeData theme) {
    return Positioned(
      bottom: 50,
      left: 16,
      right: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildLanguageSelector(theme),
          const SizedBox(height: 20),
          buildNextButton(context),
        ],
      ),
    );
  }

  Widget buildLanguageSelector(ThemeData theme) {
    return Selector<RootPR, AppLanguage>(
      selector: (context, provider) => provider.appLanguage,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            bottomSheetChooseLanguage(context, () {});
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLangsList()
                    .appLangs
                    .firstWhere((element) => element.code == value)
                    .name,
                style: theme.textTheme.titleSmall,
              ),
              const Icon(Icons.arrow_drop_down_rounded),
            ],
          ),
        );
      },
    );
  }

  Widget buildNextButton(
    BuildContext context,
  ) {
    return CustomButtonWidget(
      borderRaidus: 100,
      width: 75.w,
      height: 75.h,
      onPressed: () {
        privacyBottomSheet(context);
      },
      text: "",
      child: const Icon(Icons.arrow_forward),
    );
  }
}
