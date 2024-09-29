import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

//Tiếng Nga

HashMap languageRussia = HashMap<dynamic, String>()
  ..addAll({
    HomeLangDifinition.trangChu: 'Главная',
    HomeLangDifinition.taoDanhMuc: 'Создать категорию',
    HomeLangDifinition.tatCa: 'Все',
    HomeLangDifinition.tenDanhMuc: 'Название категории',
    HomeLangDifinition.nhapTenDanhMuc: 'Введите название категории',
    HomeLangDifinition.chiTietTaiKhoan: 'Детали аккаунта',
    HomeLangDifinition.suaTaiKhoan: 'Редактировать аккаунт',
    HomeLangDifinition.xoaTaiKhoan: 'Удалить аккаунт',
    HomeLangDifinition.nhanNut: 'Нажмите',
    HomeLangDifinition.deThemTaiKhoan: 'чтобы добавить новый аккаунт',
    HomeLangDifinition.timKiem: 'Поиск',
    HomeLangDifinition.hintSearch:
        'Введите название приложения или имя пользователя для поиска',
    HomeLangDifinition.chinhSachBaoMat: 'Политика конфиденциальности',
    HomeLangDifinition.dieuKhoanDichVu: 'Условия обслуживания',
    HomeLangDifinition.giayPhepVaPhapLy: 'Лицензия и юридическая информация',
    HomeLangDifinition.danhGiaUngDung: 'Оценить приложение',
    HomeLangDifinition.quanLyTotp: 'Управление TOTPs',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'Согласен с политикой конфиденциальности и условиями обслуживания',
    HomeLangDifinition.tiepTuc: 'Продолжить',
    HomeLangDifinition.chaoMungDenVoi: 'Добро пожаловать в',
    HomeLangDifinition.chonNgonNgu: 'Выберите язык',
    HomeLangDifinition.saoChepUsername: 'Копировать имя пользователя',
    HomeLangDifinition.saoChepMatKhau: 'Копировать пароль',
    HomeLangDifinition.saoChepThanhCong: 'Успешно скопировано',
    HomeLangDifinition.chonTaiKhoan: 'Выбрать аккаунт',
    HomeLangDifinition.boChonTaiKhoan: 'Отменить выбор аккаунта',
    HomeLangDifinition.doiDanhMuc: 'Изменить категорию',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'Вы уверены, что хотите удалить выбранные аккаунты?',
    HomeLangDifinition.taoMatKhau: 'Генератор паролей',
    HomeLangDifinition.saoChep: 'Копировать',
    HomeLangDifinition.suDung: 'Использовать',
    HomeLangDifinition.quayLai: 'Назад',
    HomeLangDifinition.kyHieu: 'Символы',
    HomeLangDifinition.so: 'Числа',
    HomeLangDifinition.kiemTraBaoMat: 'Проверка безопасности',
    HomeLangDifinition.gioiThieu: 'О CyberSafe',
    HomeLangDifinition.nhaPhatTrien: 'Разработчик',
    HomeLangDifinition.yeuCauTinhNang: 'Запрос функции',
    HomeLangDifinition.cauHoiThuongGap: 'Часто задаваемые вопросы',
    HomeLangDifinition.phienBanNangCao: 'Расширенная версия',
    HomeLangDifinition.yeuCauNgonNgu: 'Запрос языка',

    CreateAccountLangDif.taoTaiKhoan: "Создать аккаунт",
    CreateAccountLangDif.capNhatTaiKhoan: "Обновить аккаунт",
    CreateAccountLangDif.tenUngdung: "Название приложения",
    CreateAccountLangDif.tenTaiKhoan: "Имя пользователя",
    CreateAccountLangDif.matKhau: "Пароль",
    CreateAccountLangDif.tenTruong: "Название поля",
    CreateAccountLangDif.ghiChu: "Заметки",
    CreateAccountLangDif.khoaXacThucHaiLop: "Ключ аутентификатора TOTP",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "Добавить ключ TOTP",
    CreateAccountLangDif.vanBan: "Открытый текст",
    CreateAccountLangDif.vanBanBaoMat: "Закрытый текст",
    CreateAccountLangDif.themKhoa: "Добавить ключ",
    CreateAccountLangDif.themTruong: "Добавить поле",
    CreateAccountLangDif.chonDanhMuc: "Выбрать категорию",
    CreateAccountLangDif.tenDanhMuc: "Название категории",
    CreateAccountLangDif.nhapTenDanhMuc: "Введите название категории",
    CreateAccountLangDif.themDanhMuc: "Создать категорию",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "Введите ключ TOTP",
    CreateAccountLangDif.keyKhongHopLe:
        "Недействительный ключ, попробуйте снова!",
    CreateAccountLangDif.thongBao: "Уведомление",
    CreateAccountLangDif.vuiLongChonDanhMuc: "Пожалуйста, выберите категорию",
    CreateAccountLangDif.dong: "Закрыть",
    CreateAccountLangDif.vuiLongNhapTenUngDung:
        "Пожалуйста, введите название приложения",
    CreateAccountLangDif.doiIcon: "Изменить значок",
    CreateAccountLangDif.khongChon: "Не выбрано",
    CreateAccountLangDif.chonIcon: "Выбрать значок",
    CreateAccountLangDif.kieuDuLieu: "Тип данных",
    CreateAccountLangDif.tenDangNhap: "Имя пользователя",
    CreateAccountLangDif.vuiLongNhapTenTruong:
        "Пожалуйста, введите название поля",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "Вы хотите перезаписать старый пароль новым?",
    CreateAccountLangDif.dongY: "Согласен",

    DetailsAccountLangDef.danhMuc: "Категория",
    DetailsAccountLangDef.ghiChu: "Заметки",
    DetailsAccountLangDef.maXacThucTOTP: "Код аутентификации TOTP",
    DetailsAccountLangDef.thongTinTaiKhoan: "Информация об аккаунте",
    DetailsAccountLangDef.thongTinTuyChinh: "Настраиваемая информация",
    DetailsAccountLangDef.sua: "Редактировать",
    DetailsAccountLangDef.luu: "Сохранить",
    DetailsAccountLangDef.matKhau: "Пароль",
    DetailsAccountLangDef.tenTaiKhoan: "Имя пользователя",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "Вы уверены, что хотите удалить этот аккаунт?",
    DetailsAccountLangDef.xoaTaiKhoan: "Удалить аккаунт",
    DetailsAccountLangDef.xoaTaiKhoanThanhCong: "Аккаунт успешно удалён",
    DetailsAccountLangDef.xoaTaiKhoanThatBai: "Не удалось удалить аккаунт",
    DetailsAccountLangDef.dong: "Закрыть",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "Последний пароль",
    DetailsAccountLangDef.lichSuMatKhau: "История паролей",
    DetailsAccountLangDef.chiTiet: "Детали",
    DetailsAccountLangDef.capNhatVao: "Обновлено в",

    CateManagerLangDef.quanLyDanhMuc: "Управление категориями",
    CateManagerLangDef.capNhatDanhMuc: "Обновить категорию",
    CateManagerLangDef.luuYHuongDan:
        "Примечание: Нажмите и удерживайте, перетащите, чтобы изменить порядок списка категорий.",
    CateManagerLangDef.xoa: "Удалить",
    CateManagerLangDef.huy: "Отмена",
    CateManagerLangDef.xoaDanhMuc: "Удалить категорию",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "Вы уверены, что хотите удалить эту категорию?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "Эта категория содержит аккаунты, пожалуйста, удалите их перед удалением категории.",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "Просмотреть список аккаунтов в этой категории",

    LocalAuthLangDef.taoMaPin: "Создайте ваш PIN-код",
    LocalAuthLangDef.xacNhanMaPin: "Подтвердите ваш PIN-код",
    LocalAuthLangDef.dangNhapVoiMaPin: "Вход с использованием PIN-кода",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin:
        "Пожалуйста, введите полный PIN-код",
    LocalAuthLangDef.nhapMaPin: "Введите PIN-код",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu: "Введите PIN-код резервного файла",
    LocalAuthLangDef.nhapMaPinMoi: "Введите новый PIN-код",

    SettingLangDef.caiDat: "Настройки",
    SettingLangDef.doiNgonNgu: "Изменить язык",
    SettingLangDef.tuyChinhGiaoDien: "Изменить режим темы",
    SettingLangDef.giaoDienSang: "Светлая тема",
    SettingLangDef.giaoDienToi: "Темная тема",
    SettingLangDef.heThong: "Система",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Импорт из Google Password Manager",
    SettingLangDef.khongCoDuLieuDeSaoLuu:
        "Нет данных для резервного копирования",
    SettingLangDef.thoiGianKhoaTuDong: "Время автоматической блокировки",
    SettingLangDef.phut: "минут",
    SettingLangDef.xacNhan: "Подтвердить",
    SettingLangDef.themDuLieuTuTrinhDuyet: "Импорт из браузера",
    SettingLangDef.khoaSinhTracHoc: "Биометрическая блокировка",
    SettingLangDef.saoLuuDuLieu: "Резервное копирование данных",
    SettingLangDef.khoiPhucDuLieu: "Восстановление данных",
    SettingLangDef.khongCoQuyenTruyCap: "Нет разрешения на доступ",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "Файл резервной копии был сохранен в папке загрузок",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "Произошла ошибка при резервном копировании данных",
    SettingLangDef.khongCoFileNaoDuocChon: "Не выбран ни один файл",
    SettingLangDef.fileKhongDungDinhDang: "Файл не в правильном формате",
    SettingLangDef.khoiPhucDuLieuThanhCong: "Восстановление данных успешно",
    SettingLangDef.khoiPhucDuLieuThatBai: "Не удалось восстановить данные",
    SettingLangDef.thoiGianTuDongDangXuat: "Время автоматического выхода",
    SettingLangDef.maPinChoFileSaoLuu: "PIN-код для резервного файла",
    SettingLangDef.doiMaPin: "Изменить PIN-код",
    SettingLangDef.caiDatChung: "Общие настройки",
    SettingLangDef.baoMat: "Безопасность",
    SettingLangDef.quanLyDuLieu: "Управление данными",
    SettingLangDef.doiMaPinThanhCong: "Изменение PIN-кода успешно",
    
    CateDataSeedLangDif.congViec: "Работы",
    CateDataSeedLangDif.nganHang: "Банки",
    CateDataSeedLangDif.mangXahoi: "Социальные сети",
    CateDataSeedLangDif.hocTap: "Учебные аккаунты",

// проверка безопасности
    SecurityCheckLangDef.diemBaoMat: "Оценка безопасности",
    SecurityCheckLangDef.tongSoTaiKhoan: "Всего аккаунтов",
    SecurityCheckLangDef.tongSoMatKhauManh: "Всего надежных паролей",
    SecurityCheckLangDef.tongSoMatKhauYeu: "Всего слабых паролей",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "Всего одинаковых паролей",

    SecurityCheckLangDef.manh: "Сильный",
    SecurityCheckLangDef.yeu: "Слабый",
    SecurityCheckLangDef.giongNhau: "Одинаковый",
    SecurityCheckLangDef.quanTrong: "Важно!",
    SecurityCheckLangDef.capNhatNgayBayGio: "Обновить сейчас",
    SecurityCheckLangDef.dangCapNhat: "Обновление",
    SecurityCheckLangDef.nhacToiSau: "Напомнить позже",
    SecurityCheckLangDef.hoanTat: "Готово",
    SecurityCheckLangDef.daHieu: "Понял",

// Ключ безопасности был обновлен в новой версии, пожалуйста, обновите, чтобы обеспечить безопасность ваших данных.
    SecurityCheckLangDef.thongBaoCapNhat:
        "Ключ безопасности был обновлен в новой версии, пожалуйста, обновите, чтобы обеспечить безопасность ваших данных.",

// Вам необходимо обновить ключ, чтобы продолжить использовать эту функцию.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "Вам необходимо обновить ключ, чтобы продолжить использовать эту функцию.",
  });
