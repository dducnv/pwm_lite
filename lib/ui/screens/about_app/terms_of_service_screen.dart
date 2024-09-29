import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({super.key});

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  String termsOfService = "";
  @override
  void initState() {
    getTermsOfService();
    super.initState();
  }

  Future<void> getTermsOfService() async {
    final appLang = Provider.of<RootPR>(context, listen: false).appLanguage;
    String pathFile = "";

    if (appLang == AppLanguage.vn) {
      pathFile = "assets/markdown/terms_of_service/vn_terms_of_service.md";
    } else if (appLang == AppLanguage.india) {
      pathFile = "assets/markdown/terms_of_service/in_terms_of_service.md";
    } else if (appLang == AppLanguage.ko) {
      pathFile = "assets/markdown/terms_of_service/ko_terms_of_service.md";
    } else if (appLang == AppLanguage.ja) {
      pathFile = "assets/markdown/terms_of_service/ja_terms_of_service.md";
    } else if (appLang == AppLanguage.zh) {
      pathFile = "assets/markdown/terms_of_service/zh_terms_of_service.md";
    } else if (appLang == AppLanguage.pt_br) {
      pathFile = "assets/markdown/terms_of_service/pt_br_terms_of_service.md";
    } else if (appLang == AppLanguage.ms) {
      pathFile = "assets/markdown/terms_of_service/ms_terms_of_service.md";
    } else if (appLang == AppLanguage.id) {
      pathFile = "assets/markdown/terms_of_service/id_terms_of_service.md";
    } else if (appLang == AppLanguage.th) {
      pathFile = "assets/markdown/terms_of_service/th_terms_of_service.md";
    } else if (appLang == AppLanguage.ru) {
      pathFile = "assets/markdown/terms_of_service/ru_terms_of_service.md";
    } else {
      pathFile = "assets/markdown/terms_of_service/en_terms_of_service.md";
    }
    final String response = await rootBundle.loadString(pathFile);
    setState(() {
      termsOfService = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Terms of Service",
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
                  data: termsOfService,
                ),
              ),
            ],
          ),
        ));
  }
}
