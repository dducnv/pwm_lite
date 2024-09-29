import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

HashMap languageThailand = HashMap<dynamic, String>()
  ..addAll({
    HomeLangDifinition.trangChu: 'หน้าแรก',
    HomeLangDifinition.taoDanhMuc: 'สร้างหมวดหมู่',
    HomeLangDifinition.tatCa: 'ทั้งหมด',
    HomeLangDifinition.tenDanhMuc: 'ชื่อหมวดหมู่',
    HomeLangDifinition.nhapTenDanhMuc: 'กรุณาใส่ชื่อหมวดหมู่',
    HomeLangDifinition.chiTietTaiKhoan: 'รายละเอียดบัญชี',
    HomeLangDifinition.suaTaiKhoan: 'แก้ไขบัญชี',
    HomeLangDifinition.xoaTaiKhoan: 'ลบบัญชี',
    HomeLangDifinition.nhanNut: 'คลิก',
    HomeLangDifinition.deThemTaiKhoan: 'เพื่อเพิ่มบัญชีใหม่',
    HomeLangDifinition.timKiem: 'ค้นหา',
    HomeLangDifinition.hintSearch: 'กรุณาใส่ชื่อแอปหรือชื่อผู้ใช้เพื่อค้นหา',
    HomeLangDifinition.chinhSachBaoMat: 'นโยบายความเป็นส่วนตัว',
    HomeLangDifinition.dieuKhoanDichVu: 'ข้อกำหนดในการให้บริการ',
    HomeLangDifinition.giayPhepVaPhapLy: 'ใบอนุญาตและกฎหมาย',
    HomeLangDifinition.danhGiaUngDung: 'ให้คะแนนแอป',
    HomeLangDifinition.quanLyTotp: 'จัดการ TOTP',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'ยอมรับนโยบายความเป็นส่วนตัวและข้อกำหนดในการให้บริการ',
    HomeLangDifinition.tiepTuc: 'ดำเนินการต่อ',
    HomeLangDifinition.chaoMungDenVoi: 'ยินดีต้อนรับสู่',
    HomeLangDifinition.chonNgonNgu: 'เลือกภาษา',
    HomeLangDifinition.saoChepUsername: 'คัดลอกชื่อผู้ใช้',
    HomeLangDifinition.saoChepMatKhau: 'คัดลอก รหัสผ่าน',
    HomeLangDifinition.saoChepThanhCong: 'คัดลอกเรียบร้อยแล้ว',
    HomeLangDifinition.chonTaiKhoan: 'เลือกบัญชี',
    HomeLangDifinition.boChonTaiKhoan: 'ยกเลิกการเลือกบัญชี',
    HomeLangDifinition.doiDanhMuc: 'เปลี่ยนหมวดหมู่',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'คุณแน่ใจหรือไม่ว่าต้องการลบบัญชีที่เลือก?',
    HomeLangDifinition.taoMatKhau: 'สร้างรหัสผ่าน',
    HomeLangDifinition.saoChep: 'คัดลอก',
    HomeLangDifinition.suDung: 'ใช้',
    HomeLangDifinition.quayLai: 'ย้อนกลับ',
    HomeLangDifinition.kyHieu: 'อักขระพิเศษ',
    HomeLangDifinition.so: 'ตัวเลข',
    HomeLangDifinition.kiemTraBaoMat: 'ตรวจสอบความปลอดภัย',
    HomeLangDifinition.gioiThieu: 'เกี่ยวกับ CyberSafe',
    HomeLangDifinition.nhaPhatTrien: 'นักพัฒนา',
    HomeLangDifinition.yeuCauTinhNang: 'ข้อเสนอแนะฟีเจอร์',
    HomeLangDifinition.cauHoiThuongGap: 'คำถามที่พบบ่อย',
    HomeLangDifinition.phienBanNangCao: 'เวอร์ชันขั้นสูง',
    HomeLangDifinition.yeuCauNgonNgu: 'ข้อเสนอแนวทางภาษา',

    CreateAccountLangDif.taoTaiKhoan: "สร้างบัญชี",
    CreateAccountLangDif.capNhatTaiKhoan: "ปรับปรุงบัญชี",
    CreateAccountLangDif.tenUngdung: "ชื่อแอป",
    CreateAccountLangDif.tenTaiKhoan: "ชื่อผู้ใช้",
    CreateAccountLangDif.matKhau: "รหัสผ่าน",
    CreateAccountLangDif.tenTruong: "ชื่อฟิลด์",
    CreateAccountLangDif.ghiChu: "หมายเหตุ",
    CreateAccountLangDif.khoaXacThucHaiLop: "คีย์การตรวจสอบสองชั้น (TOTP)",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "เพิ่มคีย์ TOTP",
    CreateAccountLangDif.vanBan: "ข้อความสาธารณะ",
    CreateAccountLangDif.vanBanBaoMat: "ข้อความส่วนตัว",
    CreateAccountLangDif.themKhoa: "เพิ่มคีย์",
    CreateAccountLangDif.themTruong: "เพิ่มฟิลด์",
    CreateAccountLangDif.chonDanhMuc: "เลือกหมวดหมู่",
    CreateAccountLangDif.tenDanhMuc: "ชื่อหมวดหมู่",
    CreateAccountLangDif.nhapTenDanhMuc: "กรุณาใส่ชื่อหมวดหมู่",
    CreateAccountLangDif.themDanhMuc: "สร้างหมวดหมู่",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "กรุณาใส่คีย์ TOTP",
    CreateAccountLangDif.keyKhongHopLe: "คีย์ไม่ถูกต้อง กรุณาลองอีกครั้ง!",
    CreateAccountLangDif.thongBao: "การแจ้งเตือน",
    CreateAccountLangDif.vuiLongChonDanhMuc: "กรุณาเลือกหมวดหมู่",
    CreateAccountLangDif.dong: "ปิด",
    CreateAccountLangDif.vuiLongNhapTenUngDung: "กรุณาใส่ชื่อแอป",
    CreateAccountLangDif.doiIcon: "เปลี่ยนไอคอน",
    CreateAccountLangDif.khongChon: "ไม่ได้เลือก",
    CreateAccountLangDif.chonIcon: "เลือกไอคอน",
    CreateAccountLangDif.kieuDuLieu: "ประเภทข้อมูล",
    CreateAccountLangDif.tenDangNhap: "ชื่อผู้ใช้",
    CreateAccountLangDif.vuiLongNhapTenTruong: "กรุณาใส่ชื่อฟิลด์",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "คุณต้องการเขียนทับรหัสผ่านเก่าด้วยรหัสผ่านใหม่หรือไม่?",
    CreateAccountLangDif.dongY: "ตกลง",

    DetailsAccountLangDef.danhMuc: "หมวดหมู่",
    DetailsAccountLangDef.ghiChu: "หมายเหตุ",
    DetailsAccountLangDef.maXacThucTOTP: "รหัสตรวจสอบ TOTP",
    DetailsAccountLangDef.thongTinTaiKhoan: "ข้อมูลบัญชี",
    DetailsAccountLangDef.thongTinTuyChinh: "ข้อมูลที่กำหนดเอง",
    DetailsAccountLangDef.sua: "แก้ไข",
    DetailsAccountLangDef.luu: "บันทึก",
    DetailsAccountLangDef.matKhau: "รหัสผ่าน",
    DetailsAccountLangDef.tenTaiKhoan: "ชื่อผู้ใช้",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "คุณแน่ใจหรือไม่ว่าต้องการลบบัญชีนี้?",
    DetailsAccountLangDef.xoaTaiKhoan: "ลบบัญชี",
    DetailsAccountLangDef.xoaTaiKhoanThanhCong: "ลบบัญชีเรียบร้อยแล้ว",
    DetailsAccountLangDef.xoaTaiKhoanThatBai: "ลบบัญชีไม่สำเร็จ",
    DetailsAccountLangDef.dong: "ปิด",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "รหัสผ่านล่าสุด",
    DetailsAccountLangDef.lichSuMatKhau: "ประวัติรหัสผ่าน",
    DetailsAccountLangDef.chiTiet: "รายละเอียด",
    DetailsAccountLangDef.capNhatVao: "อัปเดตเมื่อ",

// category manager
    CateManagerLangDef.quanLyDanhMuc: "ผู้จัดการหมวดหมู่",
    CateManagerLangDef.capNhatDanhMuc: "อัปเดตหมวดหมู่",
    CateManagerLangDef.luuYHuongDan:
        "หมายเหตุ: กดค้างไว้แล้วลากเพื่อจัดลำดับรายการหมวดหมู่ใหม่.",
    CateManagerLangDef.xoa: "ลบ",
    CateManagerLangDef.huy: "ยกเลิก",
    CateManagerLangDef.xoaDanhMuc: "ลบหมวดหมู่",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "คุณแน่ใจหรือไม่ว่าต้องการลบหมวดหมู่นี้?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "หมวดหมู่นี้มีบัญชีอยู่ กรุณาลบบัญชีก่อนที่จะลบหมวดหมู่.",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "ดูรายการบัญชีในหมวดหมู่นี้",

    LocalAuthLangDef.taoMaPin: "สร้างรหัส PIN ของคุณ",
    LocalAuthLangDef.xacNhanMaPin: "ยืนยันรหัส PIN ของคุณ",
    LocalAuthLangDef.dangNhapVoiMaPin: "เข้าสู่ระบบด้วยรหัส PIN ของคุณ",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin: "กรุณาใส่รหัส PIN ให้ครบถ้วน",
    LocalAuthLangDef.nhapMaPin: "กรุณาใส่รหัส PIN",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu: "กรุณาใส่รหัส PIN ของไฟล์สำรอง",
    LocalAuthLangDef.nhapMaPinMoi: "กรุณาใส่รหัส PIN ใหม่",

// settings
    SettingLangDef.caiDat: "การตั้งค่า",
    SettingLangDef.doiNgonNgu: "เปลี่ยนภาษา",
    SettingLangDef.tuyChinhGiaoDien: "เปลี่ยนโหมดธีม",
    SettingLangDef.giaoDienSang: "ธีมสว่าง",
    SettingLangDef.giaoDienToi: "ธีมมืด",
    SettingLangDef.heThong: "ระบบ",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "นำเข้าจาก Google Password Manager",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "ไม่มีข้อมูลให้สำรอง",

    SettingLangDef.thoiGianKhoaTuDong: "เวลาล็อคอัตโนมัติ",
    SettingLangDef.phut: "นาที",
    SettingLangDef.xacNhan: "ยืนยัน",
    SettingLangDef.themDuLieuTuTrinhDuyet: "นำเข้าจากเบราว์เซอร์",
    SettingLangDef.khoaSinhTracHoc: "การล็อคด้วยลายนิ้วมือ",
    SettingLangDef.saoLuuDuLieu: "สำรองข้อมูล",
    SettingLangDef.khoiPhucDuLieu: "กู้คืนข้อมูล",

    SettingLangDef.khongCoQuyenTruyCap: "ไม่มีสิทธิ์เข้าถึง",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "ไฟล์สำรองถูกบันทึกในโฟลเดอร์ดาวน์โหลด",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu: "เกิดข้อผิดพลาดขณะสำรองข้อมูล",

    SettingLangDef.khongCoFileNaoDuocChon: "ไม่มีไฟล์ที่เลือก",
    SettingLangDef.fileKhongDungDinhDang: "ไฟล์ไม่ถูกต้องตามรูปแบบที่กำหนด",
    SettingLangDef.khoiPhucDuLieuThanhCong: "การกู้คืนข้อมูลสำเร็จ",
    SettingLangDef.khoiPhucDuLieuThatBai: "การกู้คืนข้อมูลไม่สำเร็จ",
    SettingLangDef.thoiGianTuDongDangXuat: "เวลาล็อคอัตโนมัติ",
    SettingLangDef.maPinChoFileSaoLuu: "รหัส PIN สำหรับไฟล์สำรอง",
    SettingLangDef.doiMaPin: "เปลี่ยนรหัส PIN",
    SettingLangDef.caiDatChung: "การตั้งค่าทั่วไป",
    SettingLangDef.baoMat: "ความปลอดภัย",
    SettingLangDef.quanLyDuLieu: "การจัดการข้อมูล",

    SettingLangDef.doiMaPinThanhCong: "เปลี่ยนรหัส PIN สำเร็จ",

// cate data seed
    CateDataSeedLangDif.congViec: "งาน",
    CateDataSeedLangDif.nganHang: "ธนาคาร",
    CateDataSeedLangDif.mangXahoi: "เครือข่ายสังคม",
    CateDataSeedLangDif.hocTap: "บัญชีการศึกษา",

// security check
    SecurityCheckLangDef.diemBaoMat: "คะแนนความปลอดภัย",
    SecurityCheckLangDef.tongSoTaiKhoan: "บัญชีทั้งหมด",
    SecurityCheckLangDef.tongSoMatKhauManh: "รหัสผ่านที่แข็งแกร่งทั้งหมด",
    SecurityCheckLangDef.tongSoMatKhauYeu: "รหัสผ่านที่อ่อนแอทั้งหมด",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "รหัสผ่านที่ซ้ำกันทั้งหมด",

    SecurityCheckLangDef.manh: "แข็งแกร่ง",
    SecurityCheckLangDef.yeu: "อ่อนแอ",
    SecurityCheckLangDef.giongNhau: "ซ้ำกัน",
    SecurityCheckLangDef.quanTrong: "สำคัญ!",
    SecurityCheckLangDef.capNhatNgayBayGio: "อัปเดตเดี๋ยวนี้",
    SecurityCheckLangDef.dangCapNhat: "กำลังอัปเดต",
    SecurityCheckLangDef.nhacToiSau: "เตือนฉันภายหลัง",
    SecurityCheckLangDef.hoanTat: "เสร็จสิ้น",
    SecurityCheckLangDef.daHieu: "เข้าใจแล้ว",

// คีย์ความปลอดภัยได้รับการอัปเดตในเวอร์ชันใหม่ กรุณาอัปเดตเพื่อให้แน่ใจในความปลอดภัยของข้อมูลของคุณ
    SecurityCheckLangDef.thongBaoCapNhat:
        "คีย์ความปลอดภัยได้รับการอัปเดตในเวอร์ชันใหม่ กรุณาอัปเดตเพื่อให้แน่ใจในความปลอดภัยของข้อมูลของคุณ.",

// คุณต้องอัปเดตคีย์เพื่อใช้ฟีเจอร์นี้ต่อไป
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "คุณต้องอัปเดตคีย์เพื่อใช้ฟีเจอร์นี้ต่อไป.",
  });
