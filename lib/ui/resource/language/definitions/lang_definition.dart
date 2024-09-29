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
    AppLangs(name: 'Русский', code: AppLanguage.ru, flag: 'ru'),
    AppLangs(name: 'हिन्दी', code: AppLanguage.india, flag: 'in'),
    AppLangs(name: '한국어', code: AppLanguage.ko, flag: 'kr'),
    AppLangs(name: '日本語', code: AppLanguage.ja, flag: 'jp'),
    AppLangs(name: '中文', code: AppLanguage.zh, flag: 'cn'),
    AppLangs(
        name: 'Brazilian Portuguese', code: AppLanguage.pt_br, flag: 'bt_BR'),
    AppLangs(name: 'Bahasa Melayu', code: AppLanguage.ms, flag: 'ms'),
    AppLangs(name: 'Bahasa Indonesia', code: AppLanguage.id, flag: 'id'),
    AppLangs(name: 'ไทย', code: AppLanguage.th, flag: 'th'),
  ];

  List<AppLangs> get appLangs => _appLangs;
}
