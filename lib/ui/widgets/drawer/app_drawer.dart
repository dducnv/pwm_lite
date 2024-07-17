import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/main.dart';
import 'package:cyber_safe/ui/resource.dart';
import 'package:cyber_safe/ui/resource/language/definitions.dart';
import 'package:cyber_safe/ui/resource/size_text_icon.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    SvgPicture.asset(
                      'assets/images/CyberSafeTrans.svg',
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'CyberSafe',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
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
