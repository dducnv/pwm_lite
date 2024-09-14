import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  final bool isHideSideBar;
  final Widget body;
  const DesktopLayout(
      {super.key, required this.body, required this.isHideSideBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isHideSideBar
            ? body
            : Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: ColoredBox(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            child: ListView(
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      color: primaryColor,
                                    ), //BoxDecoration
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/app_icon_trans.png',
                                          width: 120,
                                          height: 100,
                                        ),
                                      ],
                                    ) //UserAccountDrawerHeader
                                    ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.home,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(
                                        context, HomeLangDifinition.trangChu),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            RoutePaths.homeRoute,
                                            (route) => false);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.settings,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(context, SettingLangDef.caiDat),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            RoutePaths.settingRoute,
                                            (route) => false);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.loop_rounded,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(
                                        context, HomeLangDifinition.taoMatKhau),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            RoutePaths.passGenRoute,
                                            (route) => false);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.category,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(context,
                                        CateManagerLangDef.quanLyDanhMuc),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            RoutePaths.categoryManagerRoute,
                                            (route) => false);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.diamond,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(context,
                                        HomeLangDifinition.phienBanNangCao),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () async {
                                    openUrl(
                                        "https://play.google.com/store/apps/details?id=com.duc_app_lab_ind.cyber_safe");
                                    // Navigator.of(context)
                                    //     .pushNamed(RoutePaths.advancedVersionRoute);
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.info_rounded,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(
                                        context, HomeLangDifinition.gioiThieu),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(RoutePaths.aboutRoute);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.question_mark_rounded,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(context,
                                        HomeLangDifinition.cauHoiThuongGap),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(RoutePaths.fqaRoute);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.mail_rounded,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(context,
                                        HomeLangDifinition.yeuCauTinhNang),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    openUrl(
                                        "mailto:contact.ducnv@gmail.com?subject=[CyberSafe] Feature Request");
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.privacy_tip,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                      getText(context,
                                          HomeLangDifinition.chinhSachBaoMat),
                                      style: drawerTitleStyle),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        RoutePaths.privacyPolicyRoute);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.article,
                                    size: 24.sp,
                                  ),
                                  title: Text(
                                    getText(context,
                                        HomeLangDifinition.dieuKhoanDichVu),
                                    style: drawerTitleStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        RoutePaths.termsOfServiceRoute);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: body,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ));
  }
}
