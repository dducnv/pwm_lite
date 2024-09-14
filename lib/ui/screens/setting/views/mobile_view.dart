import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/screens/setting/extensions.dart';
import 'package:cyber_safe/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/screens.dart';
import 'package:cyber_safe/ui/screens/setting/widgets.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MobileView extends StatefulWidget {
  final SettingViewModel viewModel;
  const MobileView({
    super.key,
    required this.viewModel,
  });

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with SettingMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: getText(context, SettingLangDef.caiDat),
        onPressBack: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(getText(context, SettingLangDef.caiDatChung),
                      style: settingTitleCardStyle)),
              const SizedBox(height: 5),
              const SetThemeModeWidget(),
              const SizedBox(height: 10),
              ChangeLangWidget(
                locale: Localizations.localeOf(context),
                onTap: () {
                  bottomSheetChooseLanguage(
                      context,
                      () => {
                            setState(() {}),
                          });
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(getText(context, SettingLangDef.baoMat),
                    style: settingTitleCardStyle),
              ),
              const UseBiometricLogin(),
              const SizedBox(height: 10),
              SettingItemWidget(
                title: getText(context, SettingLangDef.doiMaPin),
                icon: Icons.pin,
                onTap: () {
                  if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                    showRequestUpdateVersionKey();
                    return;
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const RegisterScreen(
                        isChangePinCode: true,
                      );
                    }),
                  );
                },
              ),
              const SizedBox(height: 10),
              SettingItemWidget(
                title: getText(context, SettingLangDef.maPinChoFileSaoLuu),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                suffix: Row(children: [
                  ValueListenableBuilder(
                      valueListenable:
                          widget.viewModel.isRequiredPinCodeForFileBackup,
                      builder: (context, value, child) {
                        return AppCustomSwitch(
                          value: value,
                          onChanged: (value) {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return LocalAuthScreen(
                                  isVeryfiExportBackup: true,
                                  onCallBack: () {
                                    widget.viewModel
                                        .toggleRequiredPinCodeForFileBackup();
                                    Navigator.pop(context);
                                  },
                                );
                              }),
                            );
                          },
                        );
                      }),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.primary,
                    size: 18.sp,
                  ),
                ]),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              SettingItemWidget(
                title: getText(context, SettingLangDef.thoiGianTuDongDangXuat),
                suffix: Row(
                  children: [
                    DoubleValueListenBuilder(widget.viewModel.isOpenAutoLock,
                        widget.viewModel.timeAutoLock, builder:
                            (context, isOpenAutoLock, timeAutoLock, child) {
                      return Text(isOpenAutoLock ? "$timeAutoLock'" : "none",
                          style: settingTitleItemStyle);
                    }),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.lock_clock,
                      size: 24.sp,
                    )
                  ],
                ),
                onTap: () {
                  pickTimeAutoLock(context, viewModel: widget.viewModel);
                },
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    getText(context, SettingLangDef.quanLyDuLieu),
                    style: settingTitleCardStyle,
                  )),
              const SizedBox(height: 5),
              SettingItemWidget(
                title: getText(context, SettingLangDef.themDuLieuTuTrinhDuyet),
                icon: BootstrapIcons.filetype_csv,
                onTap: () {
                  if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                    showRequestUpdateVersionKey();
                    return;
                  }
                  widget.viewModel.importGooglePasswordsManagerFile();
                },
              ),
              const SizedBox(height: 10),
              SettingItemWidget(
                title: getText(context, SettingLangDef.saoLuuDuLieu),
                icon: BootstrapIcons.file_arrow_down,
                onTap: () async {
                  if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                    showRequestUpdateVersionKey();
                    return;
                  }
                  await widget.viewModel.getData();
                  if (widget.viewModel.accounts.isEmpty) {
                    showToast(
                      getText(GlobalKeys.appRootNavigatorKey.currentContext!,
                          SettingLangDef.khongCoDuLieuDeSaoLuu),
                      context: GlobalKeys.appRootNavigatorKey.currentContext!,
                      backgroundColor: Colors.redAccent,
                      animation: StyledToastAnimation.size,
                    );
                    return;
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return LocalAuthScreen(
                        isVeryfiExportBackup: true,
                        onCallBack: () {
                          widget.viewModel.exportBackupFile();
                          Navigator.pop(context);
                        },
                      );
                    }),
                  );
                },
              ),
              const SizedBox(height: 10),
              SettingItemWidget(
                title: getText(context, SettingLangDef.khoiPhucDuLieu),
                icon: BootstrapIcons.file_arrow_up,
                onTap: () {
                  if (DataShared.instance.isUpdatedVersionEncryptKey.value) {
                    showRequestUpdateVersionKey();
                    return;
                  }
                  widget.viewModel.importBackupFile(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
