import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

//Tiếng Trung
HashMap languageChina = HashMap<dynamic, String>()
  ..addAll({
    //home
    HomeLangDifinition.trangChu: '主页',
    HomeLangDifinition.taoDanhMuc: '创建类别',
    HomeLangDifinition.tatCa: '全部',
    HomeLangDifinition.tenDanhMuc: '类别名称',
    HomeLangDifinition.nhapTenDanhMuc: '输入类别名称',
    HomeLangDifinition.chiTietTaiKhoan: '账户详情',
    HomeLangDifinition.suaTaiKhoan: '编辑账户',
    HomeLangDifinition.xoaTaiKhoan: '删除账户',
    HomeLangDifinition.nhanNut: '点击',
    HomeLangDifinition.deThemTaiKhoan: '添加新账户',
    HomeLangDifinition.timKiem: '搜索',
    HomeLangDifinition.hintSearch: '输入应用名称或用户名进行搜索',
    HomeLangDifinition.chinhSachBaoMat: '隐私政策',
    HomeLangDifinition.dieuKhoanDichVu: '服务条款',
    HomeLangDifinition.giayPhepVaPhapLy: '许可证和法律',
    HomeLangDifinition.danhGiaUngDung: '评价应用',
    HomeLangDifinition.quanLyTotp: '管理TOTP',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan: '同意隐私政策和服务条款',
    HomeLangDifinition.tiepTuc: '继续',
    HomeLangDifinition.chaoMungDenVoi: '欢迎来到',
    HomeLangDifinition.chonNgonNgu: '选择语言',
    HomeLangDifinition.saoChepUsername: '复制用户名',
    HomeLangDifinition.saoChepMatKhau: '复制密码',
    HomeLangDifinition.saoChepThanhCong: '复制成功',
    HomeLangDifinition.chonTaiKhoan: '选择账户',
    HomeLangDifinition.boChonTaiKhoan: '取消选择账户',
    HomeLangDifinition.doiDanhMuc: '更改类别',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong: '您确定要删除所选账户吗？',
    HomeLangDifinition.taoMatKhau: '生成密码',
    HomeLangDifinition.saoChep: '复制',
    HomeLangDifinition.suDung: '使用',
    HomeLangDifinition.quayLai: '返回',
    HomeLangDifinition.kyHieu: '符号',
    HomeLangDifinition.so: '数字',
    HomeLangDifinition.kiemTraBaoMat: '安全检查',
    HomeLangDifinition.gioiThieu: '介绍',
    HomeLangDifinition.nhaPhatTrien: '开发者',
    HomeLangDifinition.yeuCauTinhNang: '功能请求',
    HomeLangDifinition.cauHoiThuongGap: '常见问题',

    //createAccount
    CreateAccountLangDif.taoTaiKhoan: "创建账户",
    CreateAccountLangDif.capNhatTaiKhoan: "更新账户",
    CreateAccountLangDif.tenUngdung: "应用名称",
    CreateAccountLangDif.tenTaiKhoan: "用户名",
    CreateAccountLangDif.matKhau: "密码",
    CreateAccountLangDif.tenTruong: "字段名称",
    CreateAccountLangDif.ghiChu: "备注",
    CreateAccountLangDif.khoaXacThucHaiLop: "TOTP认证密钥",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "添加TOTP密钥",
    CreateAccountLangDif.vanBan: "公开文本",
    CreateAccountLangDif.vanBanBaoMat: "私密文本",
    CreateAccountLangDif.themKhoa: "添加密钥",
    CreateAccountLangDif.themTruong: "添加字段",
    CreateAccountLangDif.chonDanhMuc: "选择类别",
    CreateAccountLangDif.tenDanhMuc: "类别名称",
    CreateAccountLangDif.nhapTenDanhMuc: "输入类别名称",
    CreateAccountLangDif.themDanhMuc: "创建类别",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "输入TOTP密钥",
    CreateAccountLangDif.keyKhongHopLe: "无效的密钥，请重试！",
    CreateAccountLangDif.thongBao: "通知",
    CreateAccountLangDif.vuiLongChonDanhMuc: "请选择类别",
    CreateAccountLangDif.dong: "关闭",
    CreateAccountLangDif.vuiLongNhapTenUngDung: "请输入应用名称",
    CreateAccountLangDif.doiIcon: "更改图标",
    CreateAccountLangDif.khongChon: "未选择",
    CreateAccountLangDif.chonIcon: "选择图标",
    CreateAccountLangDif.kieuDuLieu: "数据类型",
    CreateAccountLangDif.tenDangNhap: "用户名",
    CreateAccountLangDif.vuiLongNhapTenTruong: "请输入字段名称",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu: "您确定要覆盖旧密码吗？",
    CreateAccountLangDif.dongY: "同意",

    //detail account
    DetailsAccountLangDef.danhMuc: "类别",
    DetailsAccountLangDef.ghiChu: "备注",
    DetailsAccountLangDef.maXacThucTOTP: "TOTP认证码",
    DetailsAccountLangDef.thongTinTaiKhoan: "账户信息",
    DetailsAccountLangDef.thongTinTuyChinh: "自定义信息",
    DetailsAccountLangDef.sua: "编辑",
    DetailsAccountLangDef.luu: "保存",
    DetailsAccountLangDef.matKhau: "密码",
    DetailsAccountLangDef.tenTaiKhoan: "用户名",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay: "你确定要删除这个账户吗？",
    DetailsAccountLangDef.xoaTaiKhoan: "删除账户",
    DetailsAccountLangDef.xoaTaiKhoanThanhCong: "账户删除成功",
    DetailsAccountLangDef.xoaTaiKhoanThatBai: "账户删除失败",
    DetailsAccountLangDef.dong: "关闭",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "更新最后一次密码",
    DetailsAccountLangDef.lichSuMatKhau: "密码历史",
    DetailsAccountLangDef.chiTiet: "详情",
    DetailsAccountLangDef.capNhatVao: "更新于",

    //category manager
    CateManagerLangDef.quanLyDanhMuc: "类别管理",
    CateManagerLangDef.capNhatDanhMuc: "更新类别",
    CateManagerLangDef.luuYHuongDan: "注意：按住、拖动并放下以重新排序类别列表。",
    CateManagerLangDef.xoa: "删除",
    CateManagerLangDef.huy: "取消",
    CateManagerLangDef.xoaDanhMuc: "删除类别",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay: "你确定要删除这个类别吗？",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "此类别包含账户，请先删除账户再删除此类别。",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc: "查看此类别中的账户列表",

    //setting
    SettingLangDef.caiDat: "设置",
    SettingLangDef.doiNgonNgu: "更改语言",
    SettingLangDef.tuyChinhGiaoDien: "更改主题模式",
    SettingLangDef.giaoDienSang: "浅色主题",
    SettingLangDef.giaoDienToi: "深色主题",
    SettingLangDef.heThong: "系统",
    SettingLangDef.themDuLieuTuGooglePasswordManager: "从Google密码管理器导入",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "没有可备份的数据",

    SettingLangDef.thoiGianKhoaTuDong: "自动锁定时间",
    SettingLangDef.phut: "分钟",
    SettingLangDef.xacNhan: "确认",
    SettingLangDef.themDuLieuTuTrinhDuyet: "从浏览器导入",
    SettingLangDef.khoaSinhTracHoc: "生物识别锁",
    SettingLangDef.saoLuuDuLieu: "备份数据",
    SettingLangDef.khoiPhucDuLieu: "恢复数据",

    SettingLangDef.khongCoQuyenTruyCap: "无访问权限",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong: "备份文件已保存到下载文件夹",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu: "备份数据时发生错误",

    SettingLangDef.khongCoFileNaoDuocChon: "未选择文件",
    SettingLangDef.fileKhongDungDinhDang: "文件格式不正确",
    SettingLangDef.khoiPhucDuLieuThanhCong: "数据恢复成功",
    SettingLangDef.khoiPhucDuLieuThatBai: "数据恢复失败",
    SettingLangDef.thoiGianTuDongDangXuat: "自动注销时间",
    SettingLangDef.maPinChoFileSaoLuu: "备份文件的PIN码",
    SettingLangDef.doiMaPin: "更改PIN码",
    SettingLangDef.caiDatChung: "常规设置",
    SettingLangDef.baoMat: "安全",
    SettingLangDef.quanLyDuLieu: "数据管理",

    SettingLangDef.doiMaPinThanhCong: "更改PIN码成功",

    //local auth
    LocalAuthLangDef.taoMaPin: "创建您的PIN码",
    LocalAuthLangDef.xacNhanMaPin: "确认您的PIN码",
    LocalAuthLangDef.dangNhapVoiMaPin: "使用PIN码登录",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin: "请输入完整的PIN码",
    LocalAuthLangDef.nhapMaPin: "输入PIN码",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu: "输入备份文件的PIN码",
    LocalAuthLangDef.nhapMaPinMoi: "输入新PIN码",

    //cate data seed
    CateDataSeedLangDif.congViec: "工作",
    CateDataSeedLangDif.nganHang: "银行",
    CateDataSeedLangDif.mangXahoi: "社交网络",
    CateDataSeedLangDif.hocTap: "学习",

    //security check
    SecurityCheckLangDef.diemBaoMat: "安全分数",
    SecurityCheckLangDef.tongSoTaiKhoan: "总账户数",
    SecurityCheckLangDef.tongSoMatKhauManh: "强密码总数",
    SecurityCheckLangDef.tongSoMatKhauYeu: "弱密码总数",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "相同密码总数",

    SecurityCheckLangDef.manh: "强",
    SecurityCheckLangDef.yeu: "弱",
    SecurityCheckLangDef.giongNhau: "相同",

    SecurityCheckLangDef.quanTrong: "重要！",
    SecurityCheckLangDef.capNhatNgayBayGio: "立即更新",
    SecurityCheckLangDef.nhacToiSau: "稍后提醒",
    SecurityCheckLangDef.dangCapNhat: "更新中",
    SecurityCheckLangDef.hoanTat: "完成",
    SecurityCheckLangDef.daHieu: "明白了",

    //Khoá bảo mật đã được cập nhật trong phiên bản mới, vui lòng cập nhật để đảm bảo an toàn cho dữ liệu của bạn.
    SecurityCheckLangDef.thongBaoCapNhat: "安全锁已在新版本中更新，请更新以确保数据安全。",
    //Bạn cần cập nhật key để tiếp tục sử dụng tính năng này.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat: "您需要更新密钥才能继续使用此功能。",
  });
