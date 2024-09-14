import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/main.dart';
import 'package:cyber_safe/ui/resource.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ), //BoxDecoration
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/app_icon_trans.png',
                      width: 120.w,
                      height: 120.w,
                    ),
                  ],
                ) //UserAccountDrawerHeader
                ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.loop_rounded,
                size: 24.sp,
              ),
              title: Text(
                getText(context, HomeLangDifinition.taoMatKhau),
                style: drawerTitleStyle,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutePaths.passGenRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                size: 24.sp,
              ),
              title: Text(
                getText(context, CateManagerLangDef.quanLyDanhMuc),
                style: drawerTitleStyle,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushNamed(RoutePaths.categoryManagerRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.diamond,
                size: 24.sp,
              ),
              title: Text(
                getText(context, HomeLangDifinition.phienBanNangCao),
                style: drawerTitleStyle,
              ),
              onTap: () async {
                Navigator.of(context).pop();
                openUrl(
                    "https://play.google.com/store/apps/details?id=com.duc_app_lab_ind.cyber_safe");
                // Navigator.of(context)
                //     .pushNamed(RoutePaths.advancedVersionRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                size: 24.sp,
              ),
              title: Text(
                getText(context, HomeLangDifinition.danhGiaUngDung),
                style: drawerTitleStyle,
              ),
              onTap: () async {
                Navigator.of(context).pop();
                if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                }
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
                getText(context, HomeLangDifinition.gioiThieu),
                style: drawerTitleStyle,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutePaths.aboutRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark_rounded,
                size: 24.sp,
              ),
              title: Text(
                getText(context, HomeLangDifinition.cauHoiThuongGap),
                style: drawerTitleStyle,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutePaths.fqaRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mail_rounded,
                size: 24.sp,
              ),
              title: Text(
                getText(context, HomeLangDifinition.yeuCauTinhNang),
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
              title: Text(getText(context, HomeLangDifinition.chinhSachBaoMat),
                  style: drawerTitleStyle),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutePaths.privacyPolicyRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.article,
                size: 24.sp,
              ),
              title: Text(
                getText(context, HomeLangDifinition.dieuKhoanDichVu),
                style: drawerTitleStyle,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutePaths.termsOfServiceRoute);
              },
            ),
          ],
        ));
  }
}
