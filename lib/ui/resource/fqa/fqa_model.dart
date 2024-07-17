import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/ui/resource/fqa/fpa_en.dart';
import 'package:cyber_safe/ui/resource/fqa/fqa_in.dart';
import 'package:cyber_safe/ui/resource/fqa/fqa_ja.dart';
import 'package:cyber_safe/ui/resource/fqa/fqa_ko.dart';
import 'package:cyber_safe/ui/resource/fqa/fqa_pt_br.dart';
import 'package:cyber_safe/ui/resource/fqa/fqa_vn.dart';
import 'package:cyber_safe/ui/resource/fqa/fqa_zh.dart';

class FQAModel {
  String question;
  String answer;
  FQAModel({required this.question, required this.answer});

  static List<FQAModel> getData(AppLanguage appLanguage) {
    if (appLanguage == AppLanguage.vn) {
      return fqaVN;
    } else if (appLanguage == AppLanguage.ja) {
      return fqaJa;
    } else if (appLanguage == AppLanguage.ko) {
      return fqaKo;
    } else if (appLanguage == AppLanguage.india) {
      return fqaIn;
    } else if (appLanguage == AppLanguage.en) {
      return fqaEn;
    } else if (appLanguage == AppLanguage.zh) {
      return fqaZH;
    } else if (appLanguage == AppLanguage.pt_br) {
      return fqaPtBr;
    } else {
      return fqaEn;
    }
  }
}
