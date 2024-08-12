import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class MobileView extends StatelessWidget {
  final PassGenViewModel viewModel;
  const MobileView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const SizedBox.shrink(),
            leadingWidth: 0,
            title: Text(getText(context, HomeLangDifinition.taoMatKhau),
                style: appbarTitleStyle)),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                          child: ValueListenableBuilder(
                        valueListenable: viewModel.passwordInline,
                        builder: ((context, value, child) {
                          return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: value,
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ));
                        }),
                      )),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: viewModel.isSymbol,
                            builder: (context, value, child) {
                              return AppCustomSwitch(
                                value: value,
                                onChanged: (value) {
                                  viewModel.isSymbol.value = value;
                                  Future.delayed(
                                      const Duration(milliseconds: 100), () {
                                    viewModel.generatePassword();
                                  });
                                },
                              );
                            }),
                        Text(
                          "${getText(context, HomeLangDifinition.kyHieu)} (!@#,...)",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: viewModel.isNumber,
                            builder: (context, value, child) {
                              return AppCustomSwitch(
                                value: value,
                                onChanged: (value) {
                                  viewModel.isNumber.value = value;
                                  Future.delayed(
                                      const Duration(milliseconds: 100), () {
                                    viewModel.generatePassword();
                                  });
                                },
                              );
                            }),
                        Text(
                          "${getText(context, HomeLangDifinition.so)} (0-9)",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: viewModel.passLength,
                        builder: (context, value, child) {
                          return NumberPicker(
                            haptics: true,
                            zeroPad: false,
                            value: value,
                            selectedTextStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            itemCount: 5,
                            minValue: 8,
                            maxValue: 100,
                            itemWidth: 60.h,
                            itemHeight: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            axis: Axis.horizontal,
                            onChanged: (value) {
                              viewModel.passLength.value = value;
                              viewModel.generatePassword();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            borderRadius: BorderRadius.circular(100),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 20.sp,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    getText(
                                        context, HomeLangDifinition.quayLai),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButtonWidget(
                        borderRaidus: 100,
                        kMargin: 0,
                        width: 68.h,
                        height: 68.h,
                        // miniumSize: Size(60.w, 60.h),
                        onPressed: () {
                          viewModel.generatePassword();
                        },
                        text: "",
                        child: const Icon(Icons.loop_rounded)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              if (viewModel.isFromForm) {
                                {
                                  viewModel.onPasswordChanged!(
                                      viewModel.password.value);
                                  Navigator.of(context).pop();
                                  return;
                                }
                              }
                              clipboardCustom(
                                  context: context,
                                  text: viewModel.password.value);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    getText(
                                        context,
                                        viewModel.isFromForm
                                            ? HomeLangDifinition.suDung
                                            : HomeLangDifinition.saoChep),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 14.sp),
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(
                                    viewModel.isFromForm
                                        ? Icons.arrow_outward_rounded
                                        : Icons.copy_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
