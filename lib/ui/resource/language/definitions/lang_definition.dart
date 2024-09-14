import 'package:cyber_safe/core/enums.dart';

class AppLangs {
  final String name;
  final AppLanguage code;
  final String flag;

  AppLangs({
    required this.name,
    required this.code,
    required this.flag,
  });
}

class AppLangsList {
  final List<AppLangs> _appLangs = [
    AppLangs(name: 'English', code: AppLanguage.en, flag: 'us'),
    AppLangs(name: 'Tiếng Việt', code: AppLanguage.vn, flag: 'vn'),
    AppLangs(name: 'हिन्दी', code: AppLanguage.india, flag: 'in'),
    AppLangs(name: '한국어', code: AppLanguage.ko, flag: 'kr'),
    AppLangs(name: '日本語', code: AppLanguage.ja, flag: 'jp'),
    AppLangs(name: '中文', code: AppLanguage.zh, flag: 'cn'),
    AppLangs(
        name: 'Brazilian Portuguese', code: AppLanguage.pt_br, flag: 'bt_BR'),
  ];

  List<AppLangs> get appLangs => _appLangs;
}
