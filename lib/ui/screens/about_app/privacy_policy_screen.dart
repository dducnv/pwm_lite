import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String privacyPolicy = "";
  @override
  void initState() {
    getPrivacyPolicy();
    super.initState();
  }

  Future<void> getPrivacyPolicy() async {
    final appLang = Provider.of<RootPR>(context, listen: false).appLanguage;
    String pathFile = "";

    if (appLang == AppLanguage.vn) {
      pathFile = "assets/markdown/privacy_policy/vn_privacy_policy.md";
    } else if (appLang == AppLanguage.india) {
      pathFile = "assets/markdown/privacy_policy/in_privacy_policy.md";
    } else if (appLang == AppLanguage.ko) {
      pathFile = "assets/markdown/privacy_policy/ko_privacy_policy.md";
    } else if (appLang == AppLanguage.ja) {
      pathFile = "assets/markdown/privacy_policy/ja_privacy_policy.md";
    } else if (appLang == AppLanguage.zh) {
      pathFile = "assets/markdown/privacy_policy/zh_privacy_policy.md";
    } else if (appLang == AppLanguage.pt_br) {
      pathFile = "assets/markdown/privacy_policy/pt_br_privacy_policy.md";
    } else if (appLang == AppLanguage.ms) {
      pathFile = "assets/markdown/privacy_policy/ms_privacy_policy.md";
    } else if (appLang == AppLanguage.id) {
      pathFile = "assets/markdown/privacy_policy/id_privacy_policy.md";
    } else if (appLang == AppLanguage.th) {
      pathFile = "assets/markdown/privacy_policy/th_privacy_policy.md";
    } else if (appLang == AppLanguage.ru) {
      pathFile = "assets/markdown/privacy_policy/ru_privacy_policy.md";
    } else {
      pathFile = "assets/markdown/privacy_policy/en_privacy_policy.md";
    }
    final String response = await rootBundle.loadString(pathFile);
    setState(() {
      privacyPolicy = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Privacy Policy",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: MarkdownBody(
                  data: privacyPolicy,
                ),
              ),
            ],
          ),
        ));
  }
}
