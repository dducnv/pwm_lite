import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

//Tiếng Indonesia
HashMap languageIndo = HashMap<dynamic, String>()
  ..addAll({
    HomeLangDifinition.trangChu: 'Beranda',
    HomeLangDifinition.taoDanhMuc: 'Buat kategori',
    HomeLangDifinition.tatCa: 'Semua',
    HomeLangDifinition.tenDanhMuc: 'Nama kategori',
    HomeLangDifinition.nhapTenDanhMuc: 'Masukkan nama kategori',
    HomeLangDifinition.chiTietTaiKhoan: 'Detail akun',
    HomeLangDifinition.suaTaiKhoan: 'Edit akun',
    HomeLangDifinition.xoaTaiKhoan: 'Hapus akun',
    HomeLangDifinition.nhanNut: 'Klik',
    HomeLangDifinition.deThemTaiKhoan: 'untuk menambahkan akun baru',
    HomeLangDifinition.timKiem: 'Pencarian',
    HomeLangDifinition.hintSearch:
        'Masukkan nama aplikasi atau nama pengguna untuk mencari',
    HomeLangDifinition.chinhSachBaoMat: 'Kebijakan privasi',
    HomeLangDifinition.dieuKhoanDichVu: 'Syarat layanan',
    HomeLangDifinition.giayPhepVaPhapLy: 'Lisensi dan hukum',
    HomeLangDifinition.danhGiaUngDung: 'Nilai aplikasi',
    HomeLangDifinition.quanLyTotp: 'Kelola TOTP',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'Setuju dengan kebijakan privasi dan syarat layanan',
    HomeLangDifinition.tiepTuc: 'Lanjutkan',
    HomeLangDifinition.chaoMungDenVoi: 'Selamat datang di',
    HomeLangDifinition.chonNgonNgu: 'Pilih bahasa',
    HomeLangDifinition.saoChepUsername: 'Salin nama pengguna',
    HomeLangDifinition.saoChepMatKhau: 'Salin kata sandi',
    HomeLangDifinition.saoChepThanhCong: 'Disalin dengan sukses',
    HomeLangDifinition.chonTaiKhoan: 'Pilih akun',
    HomeLangDifinition.boChonTaiKhoan: 'Batalkan pilihan akun',
    HomeLangDifinition.doiDanhMuc: 'Ubah kategori',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'Apakah Anda yakin ingin menghapus akun yang dipilih?',
    HomeLangDifinition.taoMatKhau: 'Pembuat kata sandi',
    HomeLangDifinition.saoChep: 'Salin',
    HomeLangDifinition.suDung: 'Gunakan',
    HomeLangDifinition.quayLai: 'Kembali',
    HomeLangDifinition.kyHieu: 'Simbol',
    HomeLangDifinition.so: 'Angka',
    HomeLangDifinition.kiemTraBaoMat: 'Pemeriksaan keamanan',
    HomeLangDifinition.gioiThieu: 'Tentang CyberSafe',
    HomeLangDifinition.nhaPhatTrien: 'Pengembang',
    HomeLangDifinition.yeuCauTinhNang: 'Permintaan fitur',
    HomeLangDifinition.cauHoiThuongGap: 'FAQ',
    HomeLangDifinition.phienBanNangCao: 'Versi lanjutan',
    HomeLangDifinition.yeuCauNgonNgu: 'Permintaan bahasa',

    CreateAccountLangDif.taoTaiKhoan: "Buat akun",
    CreateAccountLangDif.capNhatTaiKhoan: "Perbarui akun",
    CreateAccountLangDif.tenUngdung: "Nama aplikasi",
    CreateAccountLangDif.tenTaiKhoan: "Nama pengguna",
    CreateAccountLangDif.matKhau: "Kata sandi",
    CreateAccountLangDif.tenTruong: "Nama bidang",
    CreateAccountLangDif.ghiChu: "Catatan",
    CreateAccountLangDif.khoaXacThucHaiLop: "Kunci otentikator TOTP",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "Tambahkan kunci TOTP",
    CreateAccountLangDif.vanBan: "Teks publik",
    CreateAccountLangDif.vanBanBaoMat: "Teks pribadi",
    CreateAccountLangDif.themKhoa: "Tambahkan kunci",
    CreateAccountLangDif.themTruong: "Tambahkan bidang",
    CreateAccountLangDif.chonDanhMuc: "Pilih kategori",
    CreateAccountLangDif.tenDanhMuc: "Nama kategori",
    CreateAccountLangDif.nhapTenDanhMuc: "Masukkan nama kategori",
    CreateAccountLangDif.themDanhMuc: "Buat kategori",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "Masukkan kunci TOTP",
    CreateAccountLangDif.keyKhongHopLe: "Kunci tidak valid, silakan coba lagi!",
    CreateAccountLangDif.thongBao: "Notifikasi",
    CreateAccountLangDif.vuiLongChonDanhMuc: "Silakan pilih kategori",
    CreateAccountLangDif.dong: "Tutup",
    CreateAccountLangDif.vuiLongNhapTenUngDung:
        "Silakan masukkan nama aplikasi",
    CreateAccountLangDif.doiIcon: "Ubah ikon",
    CreateAccountLangDif.khongChon: "Tidak dipilih",
    CreateAccountLangDif.chonIcon: "Pilih ikon",
    CreateAccountLangDif.kieuDuLieu: "Tipe data",
    CreateAccountLangDif.tenDangNhap: "Nama pengguna",
    CreateAccountLangDif.vuiLongNhapTenTruong: "Silakan masukkan nama bidang",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "Apakah Anda ingin menimpa kata sandi lama dengan yang baru?",
    CreateAccountLangDif.dongY: "Setuju",

    DetailsAccountLangDef.danhMuc: "Kategori",
    DetailsAccountLangDef.ghiChu: "Catatan",
    DetailsAccountLangDef.maXacThucTOTP: "Kode otentikator TOTP",
    DetailsAccountLangDef.thongTinTaiKhoan: "Informasi akun",
    DetailsAccountLangDef.thongTinTuyChinh: "Informasi kustom",
    DetailsAccountLangDef.sua: "Edit",
    DetailsAccountLangDef.luu: "Simpan",
    DetailsAccountLangDef.matKhau: "Kata sandi",
    DetailsAccountLangDef.tenTaiKhoan: "Nama pengguna",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "Apakah Anda yakin ingin menghapus akun ini?",
    DetailsAccountLangDef.xoaTaiKhoan: "Hapus akun",
    DetailsAccountLangDef.xoaTaiKhoanThanhCong: "Hapus akun berhasil",
    DetailsAccountLangDef.xoaTaiKhoanThatBai: "Hapus akun gagal",
    DetailsAccountLangDef.dong: "Tutup",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "Kata sandi terakhir",
    DetailsAccountLangDef.lichSuMatKhau: "Riwayat kata sandi",
    DetailsAccountLangDef.chiTiet: "Detail",
    DetailsAccountLangDef.capNhatVao: "Diperbarui pada",

    CateManagerLangDef.quanLyDanhMuc: "Manajer kategori",
    CateManagerLangDef.capNhatDanhMuc: "Perbarui kategori",
    CateManagerLangDef.luuYHuongDan:
        "Catatan: Tekan dan tahan, seret dan lepas untuk mengatur ulang daftar kategori.",
    CateManagerLangDef.xoa: "Hapus",
    CateManagerLangDef.huy: "Batal",
    CateManagerLangDef.xoaDanhMuc: "Hapus kategori",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "Apakah Anda yakin ingin menghapus kategori ini?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "Kategori ini berisi akun, silakan hapus akun tersebut sebelum menghapus kategori ini.",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "Lihat daftar akun dalam kategori ini",

    LocalAuthLangDef.taoMaPin: "Buat kode PIN Anda",
    LocalAuthLangDef.xacNhanMaPin: "Konfirmasi kode PIN Anda",
    LocalAuthLangDef.dangNhapVoiMaPin: "Masuk dengan kode PIN Anda",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin: "Silakan masukkan kode PIN lengkap",
    LocalAuthLangDef.nhapMaPin: "Masukkan kode PIN",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu:
        "Masukkan kode PIN dari file cadangan",
    LocalAuthLangDef.nhapMaPinMoi: "Masukkan kode PIN baru",
    
    SettingLangDef.caiDat: "Pengaturan",
    SettingLangDef.doiNgonNgu: "Ubah bahasa",
    SettingLangDef.tuyChinhGiaoDien: "Ubah mode tema",
    SettingLangDef.giaoDienSang: "Tema terang",
    SettingLangDef.giaoDienToi: "Tema gelap",
    SettingLangDef.heThong: "Sistem",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Impor dari Google Password Manager",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "Tidak ada data untuk cadangan",
    SettingLangDef.thoiGianKhoaTuDong: "Waktu kunci otomatis",
    SettingLangDef.phut: "menit",
    SettingLangDef.xacNhan: "Konfirmasi",
    SettingLangDef.themDuLieuTuTrinhDuyet: "Impor dari browser",
    SettingLangDef.khoaSinhTracHoc: "Kunci biometrik",
    SettingLangDef.saoLuuDuLieu: "Cadangkan data",
    SettingLangDef.khoiPhucDuLieu: "Pulihkan data",

    SettingLangDef.khongCoQuyenTruyCap: "Tidak ada izin untuk mengakses",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "File cadangan telah disimpan di folder unduhan",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "Terjadi kesalahan saat mencadangkan data",

    SettingLangDef.khongCoFileNaoDuocChon: "Tidak ada file yang dipilih",
    SettingLangDef.fileKhongDungDinhDang: "File tidak dalam format yang benar",
    SettingLangDef.khoiPhucDuLieuThanhCong: "Pemulihan data berhasil",
    SettingLangDef.khoiPhucDuLieuThatBai: "Pemulihan data gagal",
    SettingLangDef.thoiGianTuDongDangXuat: "Waktu logout otomatis",
    SettingLangDef.maPinChoFileSaoLuu: "Kode PIN untuk file cadangan",
    SettingLangDef.doiMaPin: "Ubah kode PIN",
    SettingLangDef.caiDatChung: "Pengaturan umum",
    SettingLangDef.baoMat: "Keamanan",
    SettingLangDef.quanLyDuLieu: "Manajemen data",

    SettingLangDef.doiMaPinThanhCong: "Ubah kode PIN berhasil",

    CateDataSeedLangDif.congViec: "Pekerjaan",
    CateDataSeedLangDif.nganHang: "Bank",
    CateDataSeedLangDif.mangXahoi: "Jaringan sosial",
    CateDataSeedLangDif.hocTap: "Akun edukasi",

// pemeriksaan keamanan
    SecurityCheckLangDef.diemBaoMat: "Skor keamanan",
    SecurityCheckLangDef.tongSoTaiKhoan: "Total akun",
    SecurityCheckLangDef.tongSoMatKhauManh: "Total kata sandi kuat",
    SecurityCheckLangDef.tongSoMatKhauYeu: "Total kata sandi lemah",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "Total kata sandi sama",

    SecurityCheckLangDef.manh: "Kuat",
    SecurityCheckLangDef.yeu: "Lemah",
    SecurityCheckLangDef.giongNhau: "Sama",
    SecurityCheckLangDef.quanTrong: "Penting!",
    SecurityCheckLangDef.capNhatNgayBayGio: "Perbarui sekarang",
    SecurityCheckLangDef.dangCapNhat: "Memperbarui",
    SecurityCheckLangDef.nhacToiSau: "Ingatkan saya nanti",
    SecurityCheckLangDef.hoanTat: "Selesai",
    SecurityCheckLangDef.daHieu: "Mengerti",

// Kunci keamanan telah diperbarui dalam versi baru, silakan perbarui untuk memastikan keamanan data Anda.
    SecurityCheckLangDef.thongBaoCapNhat:
        "Kunci keamanan telah diperbarui dalam versi baru, silakan perbarui untuk memastikan keamanan data Anda.",

// Anda perlu memperbarui kunci untuk terus menggunakan fitur ini.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "Anda perlu memperbarui kunci untuk terus menggunakan fitur ini.",
  });
