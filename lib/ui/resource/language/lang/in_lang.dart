import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

//Tiếng Ấn Độ
HashMap languageIndia = HashMap<dynamic, String>()
  ..addAll({
    //home
    HomeLangDifinition.trangChu: 'होम',
    HomeLangDifinition.taoDanhMuc: 'श्रेणी बनाएं',
    HomeLangDifinition.tatCa: 'सभी',
    HomeLangDifinition.tenDanhMuc: 'श्रेणी का नाम',
    HomeLangDifinition.nhapTenDanhMuc: 'श्रेणी का नाम दर्ज करें',
    HomeLangDifinition.chiTietTaiKhoan: 'खाता विवरण',
    HomeLangDifinition.suaTaiKhoan: 'खाता संपादित करें',
    HomeLangDifinition.xoaTaiKhoan: 'खाता हटाएं',
    HomeLangDifinition.nhanNut: 'क्लिक करें',
    HomeLangDifinition.deThemTaiKhoan: 'नया खाता जोड़ने के लिए',
    HomeLangDifinition.timKiem: 'खोजें',
    HomeLangDifinition.hintSearch: 'एप्लिकेशन नाम या उपयोगकर्ता नाम दर्ज करें',
    HomeLangDifinition.chinhSachBaoMat: 'गोपनीयता नीति',
    HomeLangDifinition.dieuKhoanDichVu: 'सेवा की शर्तें',
    HomeLangDifinition.giayPhepVaPhapLy: 'लाइसेंस और कानूनी',
    HomeLangDifinition.danhGiaUngDung: 'ऐप की रेटिंग',
    HomeLangDifinition.quanLyTotp: 'TOTP प्रबंधन',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'गोपनीयता नीति और सेवा की शर्तों से सहमत हैं',
    HomeLangDifinition.tiepTuc: 'जारी रखें',
    HomeLangDifinition.chaoMungDenVoi: 'Welcome to',
    HomeLangDifinition.chonNgonNgu: 'भाषा चुनें',
    HomeLangDifinition.saoChepUsername: 'उपयोगकर्ता नाम कॉपी करें',
    HomeLangDifinition.saoChepMatKhau: 'पासवर्ड कॉपी करें',
    HomeLangDifinition.saoChepThanhCong: 'सफलतापूर्वक कॉपी किया गया',
    HomeLangDifinition.chonTaiKhoan: 'खाता चुनें',
    HomeLangDifinition.boChonTaiKhoan: 'खाता अचयनित करें',
    HomeLangDifinition.doiDanhMuc: 'श्रेणी बदलें',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'क्या आप चयनित खातों को हटाना चाहते हैं?',
    HomeLangDifinition.taoMatKhau: 'पासवर्ड जेनरेटर',
    HomeLangDifinition.saoChep: 'कॉपी करें',
    HomeLangDifinition.suDung: 'उपयोग करें',
    HomeLangDifinition.quayLai: 'वापस जाएं',
    HomeLangDifinition.kyHieu: 'चिह्न',
    HomeLangDifinition.so: 'संख्या',
    HomeLangDifinition.kiemTraBaoMat: 'सुरक्षा जांच',
    HomeLangDifinition.gioiThieu: 'परिचय',
    HomeLangDifinition.nhaPhatTrien: 'डेवलपर',
    HomeLangDifinition.yeuCauTinhNang: 'सुविधा अनुरोध',
    HomeLangDifinition.cauHoiThuongGap: 'सामान्य प्रश्न',
    HomeLangDifinition.phienBanNangCao: 'उन्नत संस्करण',
    HomeLangDifinition.yeuCauNgonNgu: 'भाषा अनुरोध',

    //createAccount
    CreateAccountLangDif.taoTaiKhoan: "खाता बनाएं",
    CreateAccountLangDif.capNhatTaiKhoan: "खाता अपडेट करें",
    CreateAccountLangDif.tenUngdung: "एप्लिकेशन का नाम",
    CreateAccountLangDif.tenTaiKhoan: "उपयोगकर्ता नाम",
    CreateAccountLangDif.matKhau: "पासवर्ड",
    CreateAccountLangDif.tenTruong: "क्षेत्र का नाम",
    CreateAccountLangDif.ghiChu: "टिप्पणियाँ",
    CreateAccountLangDif.khoaXacThucHaiLop: "TOTP प्रमाणीकरण कुंजी",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "TOTP कुंजी जोड़ें",
    CreateAccountLangDif.vanBan: "सार्वजनिक पाठ",
    CreateAccountLangDif.vanBanBaoMat: "निजी पाठ",
    CreateAccountLangDif.themKhoa: "कुंजी जोड़ें",
    CreateAccountLangDif.themTruong: "क्षेत्र जोड़ें",
    CreateAccountLangDif.chonDanhMuc: "श्रेणी चुनें",
    CreateAccountLangDif.tenDanhMuc: "श्रेणी का नाम",
    CreateAccountLangDif.nhapTenDanhMuc: "श्रेणी का नाम दर्ज करें",
    CreateAccountLangDif.themDanhMuc: "श्रेणी बनाएं",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "TOTP कुंजी दर्ज करें",
    CreateAccountLangDif.keyKhongHopLe: "अमान्य कुंजी, कृपया पुन: प्रयास करें!",
    CreateAccountLangDif.thongBao: "सूचना",
    CreateAccountLangDif.vuiLongChonDanhMuc: "कृपया श्रेणी चुनें",
    CreateAccountLangDif.dong: "बंद करें",
    CreateAccountLangDif.vuiLongNhapTenUngDung:
        "कृपया एप्लिकेशन का नाम दर्ज करें",
    CreateAccountLangDif.doiIcon: "आइकन बदलें",
    CreateAccountLangDif.khongChon: "चयनित नहीं",
    CreateAccountLangDif.chonIcon: "आइकन चुनें",
    CreateAccountLangDif.kieuDuLieu: "डेटा प्रकार",
    CreateAccountLangDif.tenDangNhap: "उपयोगकर्ता नाम",
    CreateAccountLangDif.vuiLongNhapTenTruong: "कृपया क्षेत्र का नाम दर्ज करें",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "क्या आप नया पासवर्ड पुराने पासवर्ड पर लिखना चाहते हैं?",
    CreateAccountLangDif.dongY: "हाँ",

    //detailsAccount
    DetailsAccountLangDef.danhMuc: "श्रेणी",
    DetailsAccountLangDef.ghiChu: "टिप्पणियाँ",
    DetailsAccountLangDef.maXacThucTOTP: "TOTP प्रमाणीकरण कोड",
    DetailsAccountLangDef.thongTinTaiKhoan: "खाता जानकारी",
    DetailsAccountLangDef.thongTinTuyChinh: "कस्टम जानकारी",
    DetailsAccountLangDef.sua: "संपादित करें",
    DetailsAccountLangDef.luu: "सहेजें",
    DetailsAccountLangDef.matKhau: "पासवर्ड",
    DetailsAccountLangDef.tenTaiKhoan: "उपयोगकर्ता नाम",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "क्या आप इस खाते को हटाना चाहते हैं?",
    DetailsAccountLangDef.xoaTaiKhoan: "खाता हटाएं",
    DetailsAccountLangDef.dong: "बंद करें",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "हाल ही में बदला गया पासवर्ड",
    DetailsAccountLangDef.lichSuMatKhau: "पासवर्ड इतिहास",
    DetailsAccountLangDef.chiTiet: "विस्तार",
    DetailsAccountLangDef.capNhatVao: "अपडेट किया गया",

    //cateManager
    CateManagerLangDef.quanLyDanhMuc: "श्रेणी प्रबंधक",
    CateManagerLangDef.capNhatDanhMuc: "श्रेणी को अपडेट करें",
    CateManagerLangDef.luuYHuongDan:
        "ध्यान दें: श्रेणी सूची को पुनः क्रमबद्ध करने के लिए दबाएं और धकेलें।",
    CateManagerLangDef.xoa: "हटाएं",
    CateManagerLangDef.huy: "रद्द करें",
    CateManagerLangDef.xoaDanhMuc: "श्रेणी हटाएं",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "क्या आप इस श्रेणी को हटाना चाहते हैं?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "इस श्रेणी में खाता है, कृपया इसे हटाने से पहले उन्हें हटा दें।",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "इस श्रेणी में खातों की सूची देखें",

    //setting
    SettingLangDef.caiDat: "सेटिंग्स",
    SettingLangDef.doiNgonNgu: "भाषा बदलें",
    SettingLangDef.tuyChinhGiaoDien: "थीम मोड बदलें",
    SettingLangDef.giaoDienSang: "प्रकाशमान थीम",
    SettingLangDef.giaoDienToi: "अंधेरा थीम",
    SettingLangDef.heThong: "सिस्टम",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Google पासवर्ड प्रबंधक से डेटा जोड़ें",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "बैकअप करने के लिए कोई डेटा नहीं",
    SettingLangDef.thoiGianKhoaTuDong: "स्वचालित लॉक टाइम",
    SettingLangDef.phut: "मिनट",
    SettingLangDef.xacNhan: "पुष्टि करें",
    SettingLangDef.themDuLieuTuTrinhDuyet: "ब्राउज़र से डेटा जोड़ें",

    //localAuth
    LocalAuthLangDef.taoMaPin: "अपना PIN कोड बनाएं",
    LocalAuthLangDef.xacNhanMaPin: "अपना PIN कोड पुष्टि करें",
    LocalAuthLangDef.dangNhapVoiMaPin: "PIN कोड के साथ लॉग इन करें",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin: "कृपया एक पूर्ण PIN कोड दर्ज करें",
    LocalAuthLangDef.nhapMaPin: "PIN कोड दर्ज करें",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu: "बैकअप फ़ाइल का PIN कोड दर्ज करें",
    LocalAuthLangDef.nhapMaPinMoi: "नया PIN कोड दर्ज करें",
    //setting
    SettingLangDef.khoaSinhTracHoc: "बायोमैट्रिक लॉक",
    SettingLangDef.saoLuuDuLieu: "डेटा का बैकअप",
    SettingLangDef.khoiPhucDuLieu: "डेटा को बहाल करें",

    SettingLangDef.khongCoQuyenTruyCap: "पहुंच के लिए कोई अनुमति नहीं है",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "बैकअप फ़ाइल डाउनलोड फ़ोल्डर में सहेजी गई है",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "डेटा का बैकअप लेते समय एक त्रुटि आई है",

    SettingLangDef.khongCoFileNaoDuocChon: "कोई फ़ाइल चयनित नहीं है",
    SettingLangDef.fileKhongDungDinhDang: "फ़ाइल सही फ़ॉर्मेट में नहीं है",
    SettingLangDef.khoiPhucDuLieuThanhCong: "डेटा को सफलतापूर्वक बहाल किया गया",
    SettingLangDef.khoiPhucDuLieuThatBai: "डेटा को बहाल करने में विफल रहा",

    SettingLangDef.maPinChoFileSaoLuu: "बैकअप फ़ाइल के लिए पिन कोड",
    SettingLangDef.doiMaPin: "पिन कोड बदलें",
    SettingLangDef.thoiGianTuDongDangXuat: "स्वचालित लॉगआउट समय",
    SettingLangDef.caiDatChung: "सामान्य सेटिंग्स",
    SettingLangDef.baoMat: "सुरक्षा",
    SettingLangDef.quanLyDuLieu: "डेटा प्रबंधन",
    SettingLangDef.doiMaPinThanhCong: "पिन कोड सफलतापूर्वक बदल दिया गया",

    //cate data seed
    CateDataSeedLangDif.congViec: "कार्य",
    CateDataSeedLangDif.nganHang: "बैंक",
    CateDataSeedLangDif.mangXahoi: "सोशल मीडिया",
    CateDataSeedLangDif.hocTap: "शिक्षा",

    //security check
    SecurityCheckLangDef.diemBaoMat: "सुरक्षा स्कोर",
    SecurityCheckLangDef.tongSoTaiKhoan: "कुल खाते",
    SecurityCheckLangDef.tongSoMatKhauManh: "कुल मजबूत पासवर्ड",
    SecurityCheckLangDef.tongSoMatKhauYeu: "कुल कमजोर पासवर्ड",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "कुल एक ही पासवर्ड",

    SecurityCheckLangDef.manh: "मजबूत",
    SecurityCheckLangDef.yeu: "कमजोर",
    SecurityCheckLangDef.giongNhau: "एक ही",
    SecurityCheckLangDef.capNhatNgayBayGio: "अद्यतन करें",
    SecurityCheckLangDef.nhacToiSau: "बाद में याद दिलाएं",
    SecurityCheckLangDef.quanTrong: "महत्वपूर्ण!",
    SecurityCheckLangDef.hoanTat: "पूरा",
    SecurityCheckLangDef.dangCapNhat: "अद्यतन हो रहा है",
    SecurityCheckLangDef.daHieu: "समझा",

    //Khoá bảo mật đã được cập nhật trong phiên bản mới, vui lòng cập nhật để đảm bảo an toàn cho dữ liệu của bạn.
    SecurityCheckLangDef.thongBaoCapNhat:
        "सुरक्षा कुंजी नए संस्करण में अपडेट की गई है, अपडेट करने के लिए सुनिश्चित करें और अपने डेटा की सुरक्षा सुनिश्चित करें।",
    //Bạn cần cập nhật key để tiếp tục sử dụng tính năng này.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "आपको इस सुविधा का उपयोग करने के लिए कुंजी को अपडेट करने की आवश्यकता है।",
  });
