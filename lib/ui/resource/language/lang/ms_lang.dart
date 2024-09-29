import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

//Tiếng Malaysia
HashMap languageMalaysia = HashMap<dynamic, String>()
  ..addAll({
    HomeLangDifinition.trangChu: 'Laman Utama',
    HomeLangDifinition.taoDanhMuc: 'Buat Kategori',
    HomeLangDifinition.tatCa: 'Semua',
    HomeLangDifinition.tenDanhMuc: 'Nama Kategori',
    HomeLangDifinition.nhapTenDanhMuc: 'Masukkan Nama Kategori',
    HomeLangDifinition.chiTietTaiKhoan: 'Butiran Akaun',
    HomeLangDifinition.suaTaiKhoan: 'Edit Akaun',
    HomeLangDifinition.xoaTaiKhoan: 'Hapus Akaun',
    HomeLangDifinition.nhanNut: 'Klik',
    HomeLangDifinition.deThemTaiKhoan: 'untuk menambah akaun baru',
    HomeLangDifinition.timKiem: 'Carian',
    HomeLangDifinition.hintSearch:
        'Masukkan nama aplikasi atau nama pengguna untuk mencari',
    HomeLangDifinition.chinhSachBaoMat: 'Dasar Privasi',
    HomeLangDifinition.dieuKhoanDichVu: 'Terma Perkhidmatan',
    HomeLangDifinition.giayPhepVaPhapLy: 'Lesen dan Undang-Undang',
    HomeLangDifinition.danhGiaUngDung: 'Penilaian Aplikasi',
    HomeLangDifinition.quanLyTotp: 'Pengurusan TOTP',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'Setuju dengan dasar privasi dan terma perkhidmatan',
    HomeLangDifinition.tiepTuc: 'Teruskan',
    HomeLangDifinition.chaoMungDenVoi: 'Selamat datang di',
    HomeLangDifinition.chonNgonNgu: 'Pilih Bahasa',
    HomeLangDifinition.saoChepUsername: 'Salin Nama Pengguna',
    HomeLangDifinition.saoChepMatKhau: 'Salin Kata Laluan',
    HomeLangDifinition.saoChepThanhCong: 'Disalin dengan Jayanya',
    HomeLangDifinition.chonTaiKhoan: 'Pilih Akaun',
    HomeLangDifinition.boChonTaiKhoan: 'Batalkan Pilihan Akaun',
    HomeLangDifinition.doiDanhMuc: 'Tukar Kategori',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'Adakah anda pasti ingin memadam akaun yang dipilih?',
    HomeLangDifinition.taoMatKhau: 'Pencipta Kata Laluan',
    HomeLangDifinition.saoChep: 'Salin',
    HomeLangDifinition.suDung: 'Gunakan',
    HomeLangDifinition.quayLai: 'Kembali',
    HomeLangDifinition.kyHieu: 'Simbol',
    HomeLangDifinition.so: 'Nombor',
    HomeLangDifinition.kiemTraBaoMat: 'Pemeriksaan Keselamatan',
    HomeLangDifinition.gioiThieu: 'Tentang CyberSafe',
    HomeLangDifinition.nhaPhatTrien: 'Pembangun',
    HomeLangDifinition.yeuCauTinhNang: 'Permintaan Fitur',
    HomeLangDifinition.cauHoiThuongGap: 'Soalan Lazim',
    HomeLangDifinition.phienBanNangCao: 'Versi Lanjutan',
    HomeLangDifinition.yeuCauNgonNgu: 'Permintaan Bahasa',

    CreateAccountLangDif.taoTaiKhoan: "Buat Akaun",
    CreateAccountLangDif.capNhatTaiKhoan: "Kemas Kini Akaun",
    CreateAccountLangDif.tenUngdung: "Nama Aplikasi",
    CreateAccountLangDif.tenTaiKhoan: "Nama Pengguna",
    CreateAccountLangDif.matKhau: "Kata Laluan",
    CreateAccountLangDif.tenTruong: "Nama Bidang",
    CreateAccountLangDif.ghiChu: "Nota",
    CreateAccountLangDif.khoaXacThucHaiLop: "Kunci Pengesah TOTP",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "Tambah Kunci TOTP",
    CreateAccountLangDif.vanBan: "Teks Awam",
    CreateAccountLangDif.vanBanBaoMat: "Teks Peribadi",
    CreateAccountLangDif.themKhoa: "Tambah Kunci",
    CreateAccountLangDif.themTruong: "Tambah Bidang",
    CreateAccountLangDif.chonDanhMuc: "Pilih Kategori",
    CreateAccountLangDif.tenDanhMuc: "Nama Kategori",
    CreateAccountLangDif.nhapTenDanhMuc: "Masukkan Nama Kategori",
    CreateAccountLangDif.themDanhMuc: "Buat Kategori",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "Masukkan Kunci TOTP",
    CreateAccountLangDif.keyKhongHopLe: "Kunci tidak sah, sila cuba lagi!",
    CreateAccountLangDif.thongBao: "Notifikasi",
    CreateAccountLangDif.vuiLongChonDanhMuc: "Sila pilih kategori",
    CreateAccountLangDif.dong: "Tutup",
    CreateAccountLangDif.vuiLongNhapTenUngDung: "Sila masukkan nama aplikasi",
    CreateAccountLangDif.doiIcon: "Tukar Ikon",
    CreateAccountLangDif.khongChon: "Tidak Dipilih",
    CreateAccountLangDif.chonIcon: "Pilih Ikon",
    CreateAccountLangDif.kieuDuLieu: "Jenis Data",
    CreateAccountLangDif.tenDangNhap: "Nama Pengguna",
    CreateAccountLangDif.vuiLongNhapTenTruong: "Sila masukkan nama bidang",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "Adakah anda ingin menimpa kata laluan lama dengan yang baru?",
    CreateAccountLangDif.dongY: "Setuju",

    DetailsAccountLangDef.danhMuc: "Kategori",
    DetailsAccountLangDef.ghiChu: "Nota",
    DetailsAccountLangDef.maXacThucTOTP: "Kod Pengesah TOTP",
    DetailsAccountLangDef.thongTinTaiKhoan: "Maklumat Akaun",
    DetailsAccountLangDef.thongTinTuyChinh: "Maklumat Kustom",
    DetailsAccountLangDef.sua: "Edit",
    DetailsAccountLangDef.luu: "Simpan",
    DetailsAccountLangDef.matKhau: "Kata Laluan",
    DetailsAccountLangDef.tenTaiKhoan: "Nama Pengguna",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "Adakah anda pasti ingin memadam akaun ini?",
    DetailsAccountLangDef.xoaTaiKhoan: "Hapus Akaun",
    DetailsAccountLangDef.xoaTaiKhoanThanhCong: "Hapus Akaun Berjaya",
    DetailsAccountLangDef.xoaTaiKhoanThatBai: "Hapus Akaun Gagal",
    DetailsAccountLangDef.dong: "Tutup",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "Kata Laluan Terakhir",
    DetailsAccountLangDef.lichSuMatKhau: "Sejarah Kata Laluan",
    DetailsAccountLangDef.chiTiet: "Butiran",
    DetailsAccountLangDef.capNhatVao: "Dikemas kini pada",

    CateManagerLangDef.quanLyDanhMuc: "Pengurus Kategori",
    CateManagerLangDef.capNhatDanhMuc: "Kemas Kini Kategori",
    CateManagerLangDef.luuYHuongDan:
        "Nota: Tekan dan tahan, seret dan lepas untuk mengubah urutan senarai kategori.",
    CateManagerLangDef.xoa: "Hapus",
    CateManagerLangDef.huy: "Batal",
    CateManagerLangDef.xoaDanhMuc: "Hapus Kategori",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "Adakah anda pasti ingin memadam kategori ini?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "Kategori ini mengandungi akaun, sila hapuskan akaun tersebut sebelum memadam kategori ini.",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "Lihat senarai akaun dalam kategori ini",

    LocalAuthLangDef.taoMaPin: "Buat kod PIN anda",
    LocalAuthLangDef.xacNhanMaPin: "Sahkan kod PIN anda",
    LocalAuthLangDef.dangNhapVoiMaPin: "Masuk dengan kod PIN anda",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin: "Sila masukkan kod PIN lengkap",
    LocalAuthLangDef.nhapMaPin: "Masukkan kod PIN",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu:
        "Masukkan kod PIN dari fail sandaran",
    LocalAuthLangDef.nhapMaPinMoi: "Masukkan kod PIN baru",

    SettingLangDef.caiDat: "Tetapan",
    SettingLangDef.doiNgonNgu: "Tukar Bahasa",
    SettingLangDef.tuyChinhGiaoDien: "Tukar Mod Tema",
    SettingLangDef.giaoDienSang: "Tema Cerah",
    SettingLangDef.giaoDienToi: "Tema Gelap",
    SettingLangDef.heThong: "Sistem",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Impor dari Google Password Manager",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "Tiada data untuk dicadangkan",

    SettingLangDef.thoiGianKhoaTuDong: "Masa Kunci Automatik",
    SettingLangDef.phut: "minit",
    SettingLangDef.xacNhan: "Sahkan",
    SettingLangDef.themDuLieuTuTrinhDuyet: "Impor dari pelayar",
    SettingLangDef.khoaSinhTracHoc: "Kunci Biometrik",
    SettingLangDef.saoLuuDuLieu: "Caj simpan data",
    SettingLangDef.khoiPhucDuLieu: "Pulihkan data",

    SettingLangDef.khongCoQuyenTruyCap: "Tiada izin untuk mengakses",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "Fail sandaran telah disimpan di folder muat turun",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "Terjadi kesalahan semasa mencadangkan data",

    SettingLangDef.khongCoFileNaoDuocChon: "Tiada fail yang dipilih",
    SettingLangDef.fileKhongDungDinhDang: "Fail tidak dalam format yang betul",
    SettingLangDef.khoiPhucDuLieuThanhCong: "Pemulihan data berjaya",
    SettingLangDef.khoiPhucDuLieuThatBai: "Pemulihan data gagal",
    SettingLangDef.thoiGianTuDongDangXuat: "Masa log keluar automatik",
    SettingLangDef.maPinChoFileSaoLuu: "Kod PIN untuk fail sandaran",
    SettingLangDef.doiMaPin: "Tukar kod PIN",
    SettingLangDef.caiDatChung: "Tetapan Umum",
    SettingLangDef.baoMat: "Keselamatan",
    SettingLangDef.quanLyDuLieu: "Pengurusan Data",

    SettingLangDef.doiMaPinThanhCong: "Tukar kod PIN berjaya",

    CateDataSeedLangDif.congViec: "Kerja",
    CateDataSeedLangDif.nganHang: "Bank",
    CateDataSeedLangDif.mangXahoi: "Rangkaian sosial",
    CateDataSeedLangDif.hocTap: "Akaun Pendidikan",

// pemeriksaan keselamatan
    SecurityCheckLangDef.diemBaoMat: "Skor keselamatan",
    SecurityCheckLangDef.tongSoTaiKhoan: "Jumlah akaun",
    SecurityCheckLangDef.tongSoMatKhauManh: "Jumlah kata laluan yang kuat",
    SecurityCheckLangDef.tongSoMatKhauYeu: "Jumlah kata laluan yang lemah",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "Jumlah kata laluan yang sama",

    SecurityCheckLangDef.manh: "Kuat",
    SecurityCheckLangDef.yeu: "Lemah",
    SecurityCheckLangDef.giongNhau: "Sama",
    SecurityCheckLangDef.quanTrong: "Penting!",
    SecurityCheckLangDef.capNhatNgayBayGio: "Perbarui sekarang",
    SecurityCheckLangDef.dangCapNhat: "Memperbarui",
    SecurityCheckLangDef.nhacToiSau: "Ingatkan saya nanti",
    SecurityCheckLangDef.hoanTat: "Selesai",
    SecurityCheckLangDef.daHieu: "Mengerti",

// Kunci keselamatan telah diperbarui dalam versi baru, sila perbarui untuk memastikan keselamatan data anda.
    SecurityCheckLangDef.thongBaoCapNhat:
        "Kunci keselamatan telah diperbarui dalam versi baru, sila perbarui untuk memastikan keselamatan data anda.",

// Anda perlu memperbarui kunci untuk terus menggunakan fitur ini.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "Anda perlu memperbarui kunci untuk terus menggunakan fitur ini.",
  });
