// ignore_for_file: constant_identifier_names

import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

HashMap languageVn = HashMap<dynamic, String>()
  ..addAll({
    HomeLangDifinition.trangChu: 'Trang chủ',
    HomeLangDifinition.taoDanhMuc: 'Tạo danh mục',
    HomeLangDifinition.tatCa: 'Tất cả',
    HomeLangDifinition.tenDanhMuc: 'Tên danh mục',
    HomeLangDifinition.nhapTenDanhMuc: 'Nhập tên danh mục',
    HomeLangDifinition.chiTietTaiKhoan: 'Chi tiết tài khoản',
    HomeLangDifinition.suaTaiKhoan: 'Sửa tài khoản',
    HomeLangDifinition.xoaTaiKhoan: 'Xóa tài khoản',
    HomeLangDifinition.nhanNut: 'Nhấn',
    HomeLangDifinition.deThemTaiKhoan: 'để thêm tài khoản mới',
    HomeLangDifinition.timKiem: 'Tìm kiếm',
    HomeLangDifinition.hintSearch:
        'Nhập tên ứng dụng hoặc tên tài khoản để tìm kiếm',
    HomeLangDifinition.chinhSachBaoMat: 'Chính sách bảo mật',
    HomeLangDifinition.dieuKhoanDichVu: 'Điều khoản dịch vụ',
    HomeLangDifinition.giayPhepVaPhapLy: 'Giấy phép và pháp lý',
    HomeLangDifinition.danhGiaUngDung: 'Đánh giá ứng dụng',
    HomeLangDifinition.quanLyTotp: 'Quản lý TOTP',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'Đồng ý với chính sách và điều khoản',
    HomeLangDifinition.tiepTuc: 'Tiếp tục',
    HomeLangDifinition.chaoMungDenVoi: 'Chào mừng đến với',
    HomeLangDifinition.chonNgonNgu: 'Chọn ngôn ngữ',
    HomeLangDifinition.saoChepUsername: 'Sao chép tên tài khoản',
    HomeLangDifinition.saoChepMatKhau: 'Sao chép mật khẩu',
    HomeLangDifinition.saoChepThanhCong: 'Đã sao chép thành công',
    HomeLangDifinition.chonTaiKhoan: 'Chọn tài khoản',
    HomeLangDifinition.boChonTaiKhoan: 'Bỏ chọn tài khoản',
    HomeLangDifinition.doiDanhMuc: 'Đổi danh mục',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'Bạn có chắc chắn muốn xóa các tài khoản đã chọn không?',
    HomeLangDifinition.taoMatKhau: 'Tạo mật khẩu',
    HomeLangDifinition.saoChep: 'Sao chép',
    HomeLangDifinition.suDung: 'Sử dụng',
    HomeLangDifinition.quayLai: 'Quay lại',
    HomeLangDifinition.kyHieu: 'Ký hiệu',
    HomeLangDifinition.so: 'Số',
    HomeLangDifinition.kiemTraBaoMat: 'Kiểm tra bảo mật',
    HomeLangDifinition.gioiThieu: 'Giới thiệu',
    HomeLangDifinition.nhaPhatTrien: 'Nhà phát triển',
    HomeLangDifinition.yeuCauTinhNang: 'Yêu cầu tính năng',
    HomeLangDifinition.cauHoiThuongGap: 'Câu hỏi thường gặp',
    HomeLangDifinition.phienBanNangCao: 'Phiên bản nâng cao',

    //create account
    CreateAccountLangDif.taoTaiKhoan: "Tạo tài khoản",
    CreateAccountLangDif.capNhatTaiKhoan: "Cập nhật tài khoản",
    CreateAccountLangDif.tenUngdung: "Tên ứng dụng",
    CreateAccountLangDif.tenTaiKhoan: "Tên tài khoản",
    CreateAccountLangDif.matKhau: "Mật khẩu",
    CreateAccountLangDif.tenTruong: "Tên trường",
    CreateAccountLangDif.ghiChu: "Ghi chú",
    CreateAccountLangDif.khoaXacThucHaiLop: "Khoá xác thực TOTP",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "Thêm khoá TOTP",
    CreateAccountLangDif.vanBan: "Văn bản thường",
    CreateAccountLangDif.vanBanBaoMat: "Văn bản bảo mật",
    CreateAccountLangDif.themKhoa: "Thêm khoá bảo mật",
    CreateAccountLangDif.themTruong: "Thêm trường",
    CreateAccountLangDif.chonDanhMuc: "Chọn danh mục",
    CreateAccountLangDif.tenDanhMuc: "Tên danh mục",
    CreateAccountLangDif.nhapTenDanhMuc: "Nhập tên danh mục",
    CreateAccountLangDif.themDanhMuc: "Thêm danh mục",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "Nhập khoá xác thực TOTP",
    CreateAccountLangDif.keyKhongHopLe: "Khoá không hợp lệ, vui lòng thử lại!",
    CreateAccountLangDif.thongBao: "Thông báo",
    CreateAccountLangDif.vuiLongChonDanhMuc: "Vui lòng chọn danh mục",
    CreateAccountLangDif.dong: "Đóng",
    CreateAccountLangDif.vuiLongNhapTenUngDung: "Vui lòng nhập tên ứng dụng",
    CreateAccountLangDif.doiIcon: "Đổi icon",
    CreateAccountLangDif.khongChon: "Không chọn",
    CreateAccountLangDif.chonIcon: "Chọn icon",
    CreateAccountLangDif.kieuDuLieu: "Kiểu dữ liệu",
    CreateAccountLangDif.tenDangNhap: "Tên đăng nhập",
    CreateAccountLangDif.vuiLongNhapTenTruong: "Vui lòng nhập tên trường",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "Bạn có muốn mật khẩu mới ghi đè lên mật khẩu cũ không?",
    CreateAccountLangDif.dongY: "Đồng ý",

    //detail account
    DetailsAccountLangDef.danhMuc: "Danh mục",
    DetailsAccountLangDef.ghiChu: "Ghi chú",
    DetailsAccountLangDef.maXacThucTOTP: "Mã xác thực TOTP",
    DetailsAccountLangDef.thongTinTaiKhoan: "Thông tin tài khoản",
    DetailsAccountLangDef.thongTinTuyChinh: "Thông tin tùy chỉnh",
    DetailsAccountLangDef.sua: "Sửa",
    DetailsAccountLangDef.luu: "Lưu",
    DetailsAccountLangDef.matKhau: "Mật khẩu",
    DetailsAccountLangDef.tenTaiKhoan: "Tên tài khoản",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "Bạn có chắc chắn muốn xóa tài khoản này?",
    DetailsAccountLangDef.xoaTaiKhoan: "Xóa tài khoản",
    DetailsAccountLangDef.dong: "Đóng",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "Cập nhật mật khẩu gần đây",
    DetailsAccountLangDef.lichSuMatKhau: "Lịch sử mật khẩu",
    DetailsAccountLangDef.chiTiet: "Chi tiết",
    DetailsAccountLangDef.capNhatVao: "Cập nhật vào",
    //category manager
    CateManagerLangDef.quanLyDanhMuc: "Quản lý danh mục",
    CateManagerLangDef.capNhatDanhMuc: "Cập nhật danh mục",
    CateManagerLangDef.luuYHuongDan:
        "Lưu ý: Nhấn giữ, kéo và thả để sắp xếp lại danh sách danh mục.",
    CateManagerLangDef.xoa: "Xóa",
    CateManagerLangDef.huy: "Hủy",
    CateManagerLangDef.xoaDanhMuc: "Xóa danh mục",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "Bạn có chắc chắn muốn xóa danh mục này?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "Danh mục này chứa tài khoản, vui lòng cân nhắc trước khi xoá!.",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "Xem danh sách tài khoản trong danh mục",

    //setting
    SettingLangDef.caiDat: "Cài đặt",
    SettingLangDef.doiNgonNgu: "Đổi ngôn ngữ",
    SettingLangDef.tuyChinhGiaoDien: "Tùy chỉnh giao diện",
    SettingLangDef.giaoDienSang: "Giao diện sáng",
    SettingLangDef.giaoDienToi: "Giao diện tối",
    SettingLangDef.heThong: "Hệ thống",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "Không có dữ liệu để sao lưu",
    SettingLangDef.thoiGianKhoaTuDong: "Thời gian khóa tự động",
    SettingLangDef.phut: "phút",
    SettingLangDef.xacNhan: "Xác nhận",
    SettingLangDef.themDuLieuTuTrinhDuyet: "Thêm dữ liệu từ trình duyệt",

    //local auth
    LocalAuthLangDef.dangNhapVoiMaPin: "Đăng nhập với mã pin",
    LocalAuthLangDef.taoMaPin: "Tạo mã pin",
    LocalAuthLangDef.xacNhanMaPin: "Xác nhận mã pin",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin: "Vui lòng nhập đầy đủ mã pin",
    LocalAuthLangDef.nhapMaPin: "Nhập mã pin",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu: "Nhập mã pin của file sao lưu",
    LocalAuthLangDef.nhapMaPinMoi: "Nhập mã PIN mới",
    //settings
    SettingLangDef.khoaSinhTracHoc: "Khóa sinh trắc học",
    SettingLangDef.saoLuuDuLieu: "Sao lưu dữ liệu",
    SettingLangDef.khoiPhucDuLieu: "Khôi phục dữ liệu",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Thêm dữ liệu từ Google Password Manager",

    SettingLangDef.khongCoQuyenTruyCap: "Không có quyền truy cập",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "File sao lưu đã được lưu vào thư mục Download",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "Có lỗi xảy ra khi sao lưu dữ liệu",

    SettingLangDef.khongCoFileNaoDuocChon: "Không có file nào được chọn",
    SettingLangDef.fileKhongDungDinhDang: "File không đúng định dạng",
    SettingLangDef.khoiPhucDuLieuThanhCong: "Khôi phục dữ liệu thành công",
    SettingLangDef.khoiPhucDuLieuThatBai: "Khôi phục dữ liệu thất bại",

    SettingLangDef.maPinChoFileSaoLuu: "Mã PIN cho file sao lưu",
    SettingLangDef.thoiGianTuDongDangXuat: "Thời gian tự động đăng xuất",
    SettingLangDef.doiMaPin: "Đổi mã PIN",
    SettingLangDef.caiDatChung: "Cài đặt chung",
    SettingLangDef.baoMat: "Bảo mật",
    SettingLangDef.quanLyDuLieu: "Quản lý dữ liệu",
    SettingLangDef.doiMaPinThanhCong: "Đổi mã PIN thành công",

    //cate data seed
    CateDataSeedLangDif.congViec: "Công việc",
    CateDataSeedLangDif.nganHang: "Ngân hàng",
    CateDataSeedLangDif.mangXahoi: "Mạng xã hội",
    CateDataSeedLangDif.hocTap: "Học tập",

    //security check
    SecurityCheckLangDef.diemBaoMat: "Điểm bảo mật",
    SecurityCheckLangDef.tongSoTaiKhoan: "Tổng số tài khoản",
    SecurityCheckLangDef.tongSoMatKhauManh: "Tổng số mật khẩu mạnh",
    SecurityCheckLangDef.tongSoMatKhauYeu: "Tổng số mật khẩu yếu",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "Tổng số mật khẩu giống nhau",

    SecurityCheckLangDef.manh: "Mạnh",
    SecurityCheckLangDef.yeu: "Yếu",
    SecurityCheckLangDef.giongNhau: "Giống nhau",

    SecurityCheckLangDef.quanTrong: "Quan trọng!",
    SecurityCheckLangDef.capNhatNgayBayGio: "Cập nhật ngay bây giờ",
    SecurityCheckLangDef.dangCapNhat: "Đang cập nhật",
    SecurityCheckLangDef.nhacToiSau: "Nhắc tôi sau",
    SecurityCheckLangDef.hoanTat: "Hoàn tất",
    SecurityCheckLangDef.daHieu: "Đã hiểu",
    SecurityCheckLangDef.thongBaoCapNhat:
        "Khoá bảo mật đã được cập nhật trong phiên bản mới, vui lòng cập nhật để đảm bảo an toàn cho dữ liệu của bạn.",

    //Bạn cần cập nhật key để tiếp tục sử dụng tính năng này.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "Bạn cần cập nhật key để tiếp tục sử dụng tính năng này.",
  });
