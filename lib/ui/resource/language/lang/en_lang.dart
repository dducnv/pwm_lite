import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

HashMap languageEn = HashMap<dynamic, String>()
  ..addAll({
    HomeLangDifinition.trangChu: 'Home',
    HomeLangDifinition.taoDanhMuc: 'Create category',
    HomeLangDifinition.tatCa: 'All',
    HomeLangDifinition.tenDanhMuc: 'Category name',
    HomeLangDifinition.nhapTenDanhMuc: 'Enter category name',
    HomeLangDifinition.chiTietTaiKhoan: 'Account detail',
    HomeLangDifinition.suaTaiKhoan: 'Edit account',
    HomeLangDifinition.xoaTaiKhoan: 'Delete account',
    HomeLangDifinition.nhanNut: 'Click',
    HomeLangDifinition.deThemTaiKhoan: 'to add new account',
    HomeLangDifinition.timKiem: 'Search',
    HomeLangDifinition.hintSearch: 'Enter app name or username to search',
    HomeLangDifinition.chinhSachBaoMat: 'Privacy policy',
    HomeLangDifinition.dieuKhoanDichVu: 'Terms of service',
    HomeLangDifinition.giayPhepVaPhapLy: 'License and legal',
    HomeLangDifinition.danhGiaUngDung: 'Rate app',
    HomeLangDifinition.quanLyTotp: 'Manage TOTPs',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'Agree with privacy policy and terms of service',
    HomeLangDifinition.tiepTuc: 'Continue',
    HomeLangDifinition.chaoMungDenVoi: 'Welcome to',
    HomeLangDifinition.chonNgonNgu: 'Choose language',
    HomeLangDifinition.saoChepUsername: 'Copy username',
    HomeLangDifinition.saoChepMatKhau: 'Copy password',
    HomeLangDifinition.saoChepThanhCong: 'Copied successfully',
    HomeLangDifinition.chonTaiKhoan: 'Select account',
    HomeLangDifinition.boChonTaiKhoan: 'Deselect account',
    HomeLangDifinition.doiDanhMuc: 'Change category',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'Are you sure you want to delete the selected accounts?',
    HomeLangDifinition.taoMatKhau: 'Password generator',
    HomeLangDifinition.saoChep: 'Copy',
    HomeLangDifinition.suDung: 'Use',
    HomeLangDifinition.quayLai: 'Back',
    HomeLangDifinition.kyHieu: 'Symbols',
    HomeLangDifinition.so: 'Numbers',
    HomeLangDifinition.kiemTraBaoMat: 'Security check',
    HomeLangDifinition.gioiThieu: 'About CyberSafe',
    HomeLangDifinition.nhaPhatTrien: 'Developer',
    HomeLangDifinition.yeuCauTinhNang: 'Feature request',
    HomeLangDifinition.cauHoiThuongGap: 'FAQs',

    //createAccount
    CreateAccountLangDif.taoTaiKhoan: "Create account",
    CreateAccountLangDif.capNhatTaiKhoan: "Update account",
    CreateAccountLangDif.tenUngdung: "Application name",
    CreateAccountLangDif.tenTaiKhoan: "Username",
    CreateAccountLangDif.matKhau: "Password",
    CreateAccountLangDif.tenTruong: "Field name",
    CreateAccountLangDif.ghiChu: "Notes",
    CreateAccountLangDif.khoaXacThucHaiLop: "TOTP authenticator key",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "Add TOTP key",
    CreateAccountLangDif.vanBan: "Public text",
    CreateAccountLangDif.vanBanBaoMat: "Private text",
    CreateAccountLangDif.themKhoa: "Add key",
    CreateAccountLangDif.themTruong: "Add Field",
    CreateAccountLangDif.chonDanhMuc: "Choose category",
    CreateAccountLangDif.tenDanhMuc: "Category name",
    CreateAccountLangDif.nhapTenDanhMuc: "Enter category name",
    CreateAccountLangDif.themDanhMuc: "Create category",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "Enter TOTP key",
    CreateAccountLangDif.keyKhongHopLe: "Invalid key, please try again!",
    CreateAccountLangDif.thongBao: "Notification",
    CreateAccountLangDif.vuiLongChonDanhMuc: "Please choose category",
    CreateAccountLangDif.dong: "Close",
    CreateAccountLangDif.vuiLongNhapTenUngDung: "Please enter application name",
    CreateAccountLangDif.doiIcon: "Change icon",
    CreateAccountLangDif.khongChon: "Not selected",
    CreateAccountLangDif.chonIcon: "Choose icon",
    CreateAccountLangDif.kieuDuLieu: "Data type",
    CreateAccountLangDif.tenDangNhap: "Username",
    CreateAccountLangDif.vuiLongNhapTenTruong: "Please enter field name",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "Do you want to overwrite the old password with a new one?",
    CreateAccountLangDif.dongY: "Agree",

    //detail account
    DetailsAccountLangDef.danhMuc: "Category",
    DetailsAccountLangDef.ghiChu: "Notes",
    DetailsAccountLangDef.maXacThucTOTP: "TOTP authenticator code",
    DetailsAccountLangDef.thongTinTaiKhoan: "Account information",
    DetailsAccountLangDef.thongTinTuyChinh: "Custom information",
    DetailsAccountLangDef.sua: "Edit",
    DetailsAccountLangDef.luu: "Save",
    DetailsAccountLangDef.matKhau: "Password",
    DetailsAccountLangDef.tenTaiKhoan: "Username",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "Are you sure you want to delete this account?",
    DetailsAccountLangDef.xoaTaiKhoan: "Delete account",
    DetailsAccountLangDef.xoaTaiKhoanThanhCong: "Delete account successfully",
    DetailsAccountLangDef.xoaTaiKhoanThatBai: "Delete account failed",
    DetailsAccountLangDef.dong: "Close",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "Last password",
    DetailsAccountLangDef.lichSuMatKhau: "Password history",
    DetailsAccountLangDef.chiTiet: "Detail",
    DetailsAccountLangDef.capNhatVao: "Update at",

    //category manager
    CateManagerLangDef.quanLyDanhMuc: "Category manager",
    CateManagerLangDef.capNhatDanhMuc: "Update category",
    CateManagerLangDef.luuYHuongDan:
        "Note: Press and hold, drag and drop to reorder the category list.",
    CateManagerLangDef.xoa: "Delete",
    CateManagerLangDef.huy: "Cancel",
    CateManagerLangDef.xoaDanhMuc: "Delete category",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "Are you sure you want to delete this category?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "This category is containing account, please delete them before delete this category.",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "View account list in this category",

    //local auth
    LocalAuthLangDef.taoMaPin: "Create your PIN code",
    LocalAuthLangDef.xacNhanMaPin: "Confirm your PIN code",
    LocalAuthLangDef.dangNhapVoiMaPin: "Login with your PIN code",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin: "Please enter full PIN code",
    LocalAuthLangDef.nhapMaPin: "Enter PIN code",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu: "Enter PIN code of backup file",
    LocalAuthLangDef.nhapMaPinMoi: "Enter new PIN code",

    //settings
    SettingLangDef.caiDat: "Settings",
    SettingLangDef.doiNgonNgu: "Change language",
    SettingLangDef.tuyChinhGiaoDien: "Change theme mode",
    SettingLangDef.giaoDienSang: "Light theme",
    SettingLangDef.giaoDienToi: "Dark theme",
    SettingLangDef.heThong: "System",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Import from Google Password Manager",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "No data to backup",

    SettingLangDef.thoiGianKhoaTuDong: "Auto lock time",
    SettingLangDef.phut: "minutes",
    SettingLangDef.xacNhan: "Confirm",
    SettingLangDef.themDuLieuTuTrinhDuyet: "Import from browser",
    SettingLangDef.khoaSinhTracHoc: "Biometric lock",
    SettingLangDef.saoLuuDuLieu: "Backup data",
    SettingLangDef.khoiPhucDuLieu: "Restore data",

    SettingLangDef.khongCoQuyenTruyCap: "No permission to access",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "Backup file has been saved in the download folder",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "An error occurred while backing up data",

    SettingLangDef.khongCoFileNaoDuocChon: "No file selected",
    SettingLangDef.fileKhongDungDinhDang: "File is not in the correct format",
    SettingLangDef.khoiPhucDuLieuThanhCong: "Data recovery successful",
    SettingLangDef.khoiPhucDuLieuThatBai: "Data recovery failed",
    SettingLangDef.thoiGianTuDongDangXuat: "Auto logout time",
    SettingLangDef.maPinChoFileSaoLuu: "PIN code for backup file",
    SettingLangDef.doiMaPin: "Change PIN code",
    SettingLangDef.caiDatChung: "General settings",
    SettingLangDef.baoMat: "Security",
    SettingLangDef.quanLyDuLieu: "Data management",

    SettingLangDef.doiMaPinThanhCong: "Change PIN code successfully",

    //cate data seed
    CateDataSeedLangDif.congViec: "Works",
    CateDataSeedLangDif.nganHang: "Banks",
    CateDataSeedLangDif.mangXahoi: "Social networks",
    CateDataSeedLangDif.hocTap: "Edu accounts",

    //security check
    SecurityCheckLangDef.diemBaoMat: "Security score",
    SecurityCheckLangDef.tongSoTaiKhoan: "Total accounts",
    SecurityCheckLangDef.tongSoMatKhauManh: "Total strong passwords",
    SecurityCheckLangDef.tongSoMatKhauYeu: "Total weak passwords",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "Total same passwords",

    SecurityCheckLangDef.manh: "Strong",
    SecurityCheckLangDef.yeu: "Weak",
    SecurityCheckLangDef.giongNhau: "Same",
    SecurityCheckLangDef.quanTrong: "Important!",
    SecurityCheckLangDef.capNhatNgayBayGio: "Update now",
    SecurityCheckLangDef.dangCapNhat: "Updating",
    SecurityCheckLangDef.nhacToiSau: "Remind me later",
    SecurityCheckLangDef.hoanTat: "Done",
    SecurityCheckLangDef.daHieu: "Got it",

    //Khoá bảo mật đã được cập nhật trong phiên bản mới, vui lòng cập nhật để đảm bảo an toàn cho dữ liệu của bạn.
    SecurityCheckLangDef.thongBaoCapNhat:
        "The security key has been updated in the new version, please update to ensure the safety of your data.",

    //Bạn cần cập nhật key để tiếp tục sử dụng tính năng này.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "You need to update the key to continue using this feature.",
  });
