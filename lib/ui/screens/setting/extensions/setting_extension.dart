import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

mixin SettingMixin {}

extension SettingExtension on SettingMixin {
  Future<void> bottomSheetChooseLanguage(
      BuildContext context, Function() callBack) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  getText(context, HomeLangDifinition.chonNgonNgu),
                  style: settingTitleCardStyle,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: AppLangsList().appLangs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          AppLangsList().appLangs[index].name,
                          style: settingTitleItemStyle,
                        ),
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

  Future<void> pickTimeAutoLock(
    BuildContext context, {
    required SettingViewModel viewModel,
  }) async {
    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                          "${getText(context, SettingLangDef.thoiGianKhoaTuDong)}(${getText(context, SettingLangDef.phut)})",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: settingTitleCardStyle),
                    ),
                    Selector<RootPR, bool>(
                        builder: (context, value, widget) {
                          return AppCustomSwitch(
                            value: value,
                            onChanged: (value) {
                              viewModel.isOpenAutoLock.value = value;
                              context.read<RootPR>().setAutoLock(
                                  value, viewModel.timeAutoLock.value);
                            },
                          );
                        },
                        selector: (context, value) => value.isOpenAutoLock),
                  ],
                ),
                Selector<RootPR, bool>(
                    builder: (context, value, widget) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: viewModel.timeAutoLock,
                              builder: (context, timeAutoLock, child) {
                                return Opacity(
                                  opacity: value ? 1 : 0.5,
                                  child: NumberPicker(
                                    haptics: true,
                                    zeroPad: true,
                                    value: timeAutoLock < 1 ? 1 : timeAutoLock,
                                    selectedTextStyle: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    itemCount: 5,
                                    minValue: 1,
                                    maxValue: 30,
                                    itemWidth: 70.w,
                                    itemHeight: 70.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 2,
                                      ),
                                    ),
                                    axis: Axis.horizontal,
                                    onChanged: (value) {
                                      viewModel.timeAutoLock.value = value;
                                    },
                                  ),
                                );
                              }),
                          value
                              ? SizedBox(
                                  height: 70.h,
                                  width: double.infinity,
                                )
                              : SizedBox(
                                  height: 70.h,
                                  width: double.infinity,
                                  child: const ModalBarrier(
                                    dismissible: true,
                                  ),
                                )
                        ],
                      );
                    },
                    selector: (context, value) => value.isOpenAutoLock),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  kMargin: 0,
                  onPressed: () {
                    context.read<RootPR>().setAutoLock(
                        viewModel.isOpenAutoLock.value,
                        viewModel.timeAutoLock.value);
                    Navigator.pop(context);
                  },
                  text: getText(context, SettingLangDef.xacNhan),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
