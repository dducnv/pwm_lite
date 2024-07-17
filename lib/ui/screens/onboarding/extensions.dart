import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/setting/widgets.dart';
import 'package:cyber_safe/ui/widgets/button/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

extension OnboardingExtention on OnboardingScreenState {
  Future<void> bottomSheetChooseLanguage(
      BuildContext context, Function() callBack) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  getText(context, HomeLangDifinition.chonNgonNgu),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: AppLangsList().appLangs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(AppLangsList().appLangs[index].name),
                        selected: context.read<RootPR>().appLanguage ==
                            AppLangsList().appLangs[index].code,
                        onTap: () {
                          context.read<RootPR>().language(
                                AppLangsList().appLangs[index].code,
                              );

                          callBack.call();
                          Navigator.pop(context);
                        },
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> privacyBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingItemWidget(
                    icon: Icons.arrow_forward_ios_rounded,
                    titleWidth: MediaQuery.of(context).size.width * 0.5,
                    title: getText(context, HomeLangDifinition.chinhSachBaoMat),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RoutePaths.privacyPolicyRoute);
                    },
                  ),
                  const SizedBox(height: 10),
                  SettingItemWidget(
                    icon: Icons.arrow_forward_ios_rounded,
                    titleWidth: MediaQuery.of(context).size.width * 0.5,
                    title: getText(context, HomeLangDifinition.dieuKhoanDichVu),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RoutePaths.termsOfServiceRoute);
                    },
                  ),
                  const SizedBox(height: 5),
                  ValueListenableBuilder(
                    valueListenable: isDegreed,
                    builder: ((context, value, child) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: value,
                                  onChanged: (value) {
                                    isDegreed.value = value!;
                                  }),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    isDegreed.value = !isDegreed.value;
                                  },
                                  child: Text(
                                    getText(
                                        context,
                                        HomeLangDifinition
                                            .dongYVoiChinhSachVaDieuKhoan),
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          CustomButtonWidget(
                              isLoadingButton: !value,
                              kMargin: 0,
                              onPressed: () async {
                                await SecureStorage.instance.save(
                                    SecureStorageKeys.fistOpenApp.name,
                                    "false");
                                dataShared.initCategory();
                                checkIsRegister();
                              },
                              text:
                                  getText(context, HomeLangDifinition.tiepTuc)),
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
