import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

//Tiếng Nhật
HashMap languageJapan = HashMap<dynamic, String>()
  ..addAll({
    //home
    HomeLangDifinition.trangChu: 'ホーム',
    HomeLangDifinition.taoDanhMuc: 'カテゴリの作成',
    HomeLangDifinition.tatCa: 'すべて',
    HomeLangDifinition.tenDanhMuc: 'カテゴリ名',
    HomeLangDifinition.nhapTenDanhMuc: 'カテゴリ名を入力',
    HomeLangDifinition.chiTietTaiKhoan: 'アカウント詳細',
    HomeLangDifinition.suaTaiKhoan: 'アカウントの編集',
    HomeLangDifinition.xoaTaiKhoan: 'アカウントの削除',
    HomeLangDifinition.nhanNut: 'クリック',
    HomeLangDifinition.deThemTaiKhoan: '新しいアカウントを追加',
    HomeLangDifinition.timKiem: '検索',
    HomeLangDifinition.hintSearch: 'アプリ名またはユーザー名を入力して検索',
    HomeLangDifinition.chinhSachBaoMat: 'プライバシーポリシー',
    HomeLangDifinition.dieuKhoanDichVu: 'サービス利用規約',
    HomeLangDifinition.giayPhepVaPhapLy: 'ライセンスと法令',
    HomeLangDifinition.danhGiaUngDung: 'アプリを評価',
    HomeLangDifinition.quanLyTotp: 'TOTPを管理',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan: 'プライバシーポリシーと利用規約に同意',
    HomeLangDifinition.tiepTuc: '続ける',
    HomeLangDifinition.chaoMungDenVoi: 'ようこそ',
    HomeLangDifinition.chonNgonNgu: '言語を選択',
    HomeLangDifinition.saoChepUsername: 'ユーザー名をコピー',
    HomeLangDifinition.saoChepMatKhau: 'パスワードをコピー',
    HomeLangDifinition.saoChepThanhCong: 'コピーに成功',
    HomeLangDifinition.chonTaiKhoan: 'アカウントを選択',
    HomeLangDifinition.boChonTaiKhoan: 'アカウントの選択を解除',
    HomeLangDifinition.doiDanhMuc: 'カテゴリを変更',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        '選択したアカウントを削除してもよろしいですか？',
    HomeLangDifinition.taoMatKhau: 'パスワードジェネレータ',
    HomeLangDifinition.saoChep: 'コピー',
    HomeLangDifinition.suDung: '使用',
    HomeLangDifinition.quayLai: '戻る',
    HomeLangDifinition.kyHieu: '記号',
    HomeLangDifinition.so: '数',
    HomeLangDifinition.kiemTraBaoMat: 'セキュリティチェック',
    HomeLangDifinition.gioiThieu: '紹介',
    HomeLangDifinition.nhaPhatTrien: '開発者',
    HomeLangDifinition.yeuCauTinhNang: '機能リクエスト',
    HomeLangDifinition.cauHoiThuongGap: 'よくある質問',
    HomeLangDifinition.phienBanNangCao: '高度なバージョン',
    HomeLangDifinition.yeuCauNgonNgu: '言語リクエスト',

    //Create Account
    CreateAccountLangDif.taoTaiKhoan:
        "アカウントを作成", // アカウントを作成 (Akaunto o sakusei)
    CreateAccountLangDif.capNhatTaiKhoan:
        "アカウントを更新", // アカウントを更新 (Akaunto o koshin)
    CreateAccountLangDif.tenUngdung: "アプリケーション名", // アプリケーション名 (Apurikēshon mei)
    CreateAccountLangDif.tenTaiKhoan: "ユーザー名", // ユーザー名 (Yūzā-mei)
    CreateAccountLangDif.matKhau: "パスワード", // パスワード (Pasuwādo)
    CreateAccountLangDif.tenTruong: "フィールド名", // フィールド名 (Fīrudo mei)
    CreateAccountLangDif.ghiChu: "ノート", // ノート (Nōto)
    CreateAccountLangDif.khoaXacThucHaiLop:
        "TOTP認証キー", // TOTP 認証キー (TOTP ninshō kī)
    CreateAccountLangDif.themKhoaXacThucHaiLop:
        "TOTPキーを追加", // TOTPキーを追加 (TOTP kī o tsuihanno)
    CreateAccountLangDif.vanBan: "公開テキスト", // 公開テキスト (Kōkai tekisuto)
    CreateAccountLangDif.vanBanBaoMat: "非公開テキスト", // 非公開テキスト (Hikōkai tekisuto)
    CreateAccountLangDif.themKhoa: "キーを追加", // キーを追加 (Kī o tsuihanno)
    CreateAccountLangDif.themTruong:
        "フィールドを追加", // フィールドを追加 (Fīrudo o tsuihanno)
    CreateAccountLangDif.chonDanhMuc:
        "カテゴリを選択", // カテゴリを選択 (Kategoria o sentaku)
    CreateAccountLangDif.tenDanhMuc: "カテゴリ名", // カテゴリ名 (Kategoria mei)
    CreateAccountLangDif.nhapTenDanhMuc:
        "カテゴリ名を入力", // カテゴリ名を入力 (Kategoria mei o nyūryoku)
    CreateAccountLangDif.themDanhMuc:
        "カテゴリを作成", // カテゴリを作成 (Kategoria o sakusei)
    CreateAccountLangDif.nhapKhoaXacThucTOTP:
        "TOTPキーを入力", // TOTPキーを入力 (TOTP kī o nyūryoku)
    CreateAccountLangDif.keyKhongHopLe:
        "無効なキーです。もう一度お試しください。", // Mukōna kī desu. Mō ichido o coba shite kudasai. (Invalid key, please try again!)
    CreateAccountLangDif.thongBao: "通知", // Tsūchi (Notification)
    CreateAccountLangDif.vuiLongChonDanhMuc:
        "カテゴリを選択してください", // Kategoria o sentaku shite kudasai (Please choose category)
    CreateAccountLangDif.dong: "閉じる", // Toじる (Tojiru) (Close)
    CreateAccountLangDif.vuiLongNhapTenUngDung:
        "アプリケーション名を入力してください", // Apurikēshon mei o nyūryoku shite kudasai (Please enter application name)
    CreateAccountLangDif.doiIcon: "アイコンを変更", // Aikone o henkō (Change icon)
    CreateAccountLangDif.khongChon:
        "選択されていません", // Sentaku sarete imasen (Not selected)
    CreateAccountLangDif.chonIcon: "アイコンを選択", // Aikone o sentaku (Choose icon)
    CreateAccountLangDif.kieuDuLieu: "データ型", // Dēta-gata (Data type)
    CreateAccountLangDif.tenDangNhap: "ユーザー名", // Yūzā-mei (Username)
    CreateAccountLangDif.vuiLongNhapTenTruong:
        "フィールド名を入力してください", // Fīrudo mei o nyūryoku shite kudasai (Please enter field name)
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "新しいパスワードを古いパスワードに上書きしますか？", // Atarashī pasuwādo o furui pasuwādo ni uwagaki shimasu ka? (Do you want to overwrite the old password with the new password?)
    CreateAccountLangDif.dongY: "はい", // Hai (Yes)
    //detail account
    DetailsAccountLangDef.danhMuc: "カテゴリ", // Kategoria (Category)
    DetailsAccountLangDef.ghiChu: "ノート", // Nōto (Notes)
    DetailsAccountLangDef.maXacThucTOTP:
        "TOTP認証コード", // TOTP ninshō kōdo (TOTP authenticator code)
    DetailsAccountLangDef.thongTinTaiKhoan:
        "アカウント情報", // Akaunto jōhō (Account information)
    DetailsAccountLangDef.thongTinTuyChinh:
        "カスタム情報", // Kasutomu jōhō (Custom information)
    DetailsAccountLangDef.sua: "編集", // Henshū (Edit)
    DetailsAccountLangDef.luu: "保存", // Hosan (Save)
    DetailsAccountLangDef.matKhau: "パスワード", // Pasuwādo (Password)
    DetailsAccountLangDef.tenTaiKhoan: "ユーザー名", // Yūzā-mei (Username)
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "このアカウントを削除してもよろしいですか？", // Kono akaunto o sakujō shite mo yoroshī desu ka? (Are you sure you want to delete this account?)
    DetailsAccountLangDef.xoaTaiKhoan:
        "アカウントを削除", // Akaunto o sakujō (Delete account)
    DetailsAccountLangDef.xoaTaiKhoanThanhCong:
        "アカウントの削除に成功しました", // Akaunto no sakujō ni seikō shimashita (Delete account successfully)
    DetailsAccountLangDef.xoaTaiKhoanThatBai:
        "アカウントの削除に失敗しました", // Akaunto no sakujō ni shippai shimashita (Delete account failed)
    DetailsAccountLangDef.dong: "閉じる", // Tojiru (Close)
    DetailsAccountLangDef.capNhatMatKhauLanCuoi:
        "最後のパスワード更新", // Saigo no pasuwādo kōshin (Last password update)
    DetailsAccountLangDef.lichSuMatKhau:
        "パスワード履歴", // Pasuwādo rireki (Password history)
    DetailsAccountLangDef.chiTiet: "詳細", // Shōsai (Details)
    DetailsAccountLangDef.capNhatVao: "更新", // Kōshin (Update)
    //category manager
    CateManagerLangDef.quanLyDanhMuc:
        "カテゴリ管理", // Kategoria kanri (Category manager)
    CateManagerLangDef.capNhatDanhMuc:
        "カテゴリを更新", // Kategoria o koshin (Update category)
    CateManagerLangDef.luuYHuongDan:
        "注: カテゴリリストの順序を変更するには、長押ししてドラッグアンドドロップします。", // Chū: Kategoria risuto no junjo o henkō suru ni wa, nagaoshite doraggu ando doroppu shimasu. (Note: Press and hold, drag and drop to reorder the category list.)
    CateManagerLangDef.xoa: "削除", // Sakujō (Delete)
    CateManagerLangDef.huy: "キャンセル", // Kyanseru (Cancel)
    CateManagerLangDef.xoaDanhMuc:
        "カテゴリを削除", // Kategoria o sakujō (Delete category)
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "このカテゴリを削除してもよろしいですか？", // Kono kategoria o sakujō shite mo yoroshī desu ka? (Are you sure you want to delete this category?)
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "このカテゴリにはアカウントが含まれています。このカテゴリを削除する前に削除してください。", // Kono kategoria ni wa akaunto ga fukumarete imasu. Kono kategoria o sakujō suru mae ni sakujō shite kudasai. (This category is containing account, please delete them before delete this category.)
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "このカテゴリ内のアカウントリストを表示", // Kono kategoria-nai no akaunto risuto o hyōji (View account list in this category)

    //setting
    SettingLangDef.caiDat: "設定", // Setei (Settings)
    SettingLangDef.doiNgonNgu: "言語の変更", // Gengo no henkō (Change language)
    SettingLangDef.tuyChinhGiaoDien:
        "テーマモードを変更", // Tēma mōdo o henkō (Change theme mode)
    SettingLangDef.giaoDienSang: "ライトテーマ", // Raito tēma (Light theme)
    SettingLangDef.giaoDienToi: "ダークテーマ", // Dāku tēma (Dark theme)
    SettingLangDef.heThong: "システム", // Shisutemu (System)
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Google Password Manager からインポート", // Google Password Manager kara inpōto (Import from Google Password Manager)
    SettingLangDef.khongCoDuLieuDeSaoLuu:
        "バックアップするデータがありません", // Bakkuappu suru dēta ga arimasen (No data to backup)

    SettingLangDef.thoiGianKhoaTuDong:
        "自動ロック時間", // Jidō rokku jikan (Auto lock time)
    SettingLangDef.phut: "分", // Fun (minutes)
    SettingLangDef.xacNhan: "確認", // Kakunin (Confirm)
    SettingLangDef.themDuLieuTuTrinhDuyet:
        "ブラウザからインポート", // Burauza kara inpōto (Import from browser)
    SettingLangDef.khoaSinhTracHoc:
        "生体認証ロック", // Seitai ninshō rokku (Biometric lock)
    SettingLangDef.saoLuuDuLieu:
        "データのバックアップ", // Dēta no bakkuappu (Backup data)
    SettingLangDef.khoiPhucDuLieu: "データの復元", // Dēta no fukugan (Restore data)

    SettingLangDef.khongCoQuyenTruyCap:
        "アクセス権限がありません", // Akusesu kengen ga arimasen (No permission to access)
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "バックアップファイルはダウンロードフォルダに保存されました", // Bakkuappu fairu wa dauraун로드foruda ni hokkan sa remashita (Backup file has been saved in the download folder)
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "データのバックアップ中にエラーが発生しました", // Dēta no bakkuappu chūni erā ga hassei shimashita (An error occurred while backing up data)

    SettingLangDef.khongCoFileNaoDuocChon:
        "ファイルが選択されていません", // Fairu ga sentaku sarete imasen (No file selected)
    SettingLangDef.fileKhongDungDinhDang:
        "ファイルが正しい形式ではありません", // Fairu ga tadashī keishiki dewa arimasen (File is not in the correct format)
    SettingLangDef.khoiPhucDuLieuThanhCong:
        "データの復元が成功しました", // Dēta no fukugan ga seikō shimashita (Data recovery successful)
    SettingLangDef.khoiPhucDuLieuThatBai:
        "データの復元が失敗しました", // Dēta no fukugan ga shippai shimashita (Data recovery failed)
    SettingLangDef.thoiGianTuDongDangXuat:
        "自動ログアウト時間", // Jidō roguauto jikan (Auto logout time)
    SettingLangDef.maPinChoFileSaoLuu:
        "バックアップファイルのPINコード", // Bakkuappu fairu no PIN kōdo (PIN code for backup file)
    SettingLangDef.doiMaPin: "PINコードを変更", // PIN kōdo o henkō (Change PIN code)
    SettingLangDef.caiDatChung: "一般設定", // Ippan setei (General settings)
    SettingLangDef.baoMat: "セキュリティ", // Sekyuritī (Security)
    SettingLangDef.quanLyDuLieu: "データ管理", // Dēta kanri (Data management)

    SettingLangDef.doiMaPinThanhCong:
        "PINコードの変更に成功しました", // PIN kōdo no henkō ni seikō shimashita (Change PIN code successfully)

    //local authen
    LocalAuthLangDef.taoMaPin:
        "PINコードを作成", // PIN kōdo o sakusei (Create your PIN code)
    LocalAuthLangDef.xacNhanMaPin:
        "PINコードを確認", // PIN kōdo o kakunin (Confirm your PIN code)
    LocalAuthLangDef.dangNhapVoiMaPin:
        "PINコードでログイン", // PIN kōdo de rogin (Login with your PIN code)
    LocalAuthLangDef.vuiLongNhapDayDuMaPin:
        "PINコードを完全に入力してください", // PIN kōdo o kanzen ni nyūryoku shite kudasai (Please enter full PIN code)
    LocalAuthLangDef.nhapMaPin:
        "PINコードを入力", // PIN kōdo o nyūryoku (Enter PIN code)
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu:
        "バックアップファイルのPINコードを入力", // Bakkuappu fairu no PIN kōdo o nyūryoku (Enter PIN code of backup file)
    LocalAuthLangDef.nhapMaPinMoi:
        "新しいPINコードを入力", // Atarashī PIN kōdo o nyūryoku (Enter new PIN code)

    //cate data seed
    CateDataSeedLangDif.congViec: "仕事", // Shigoto (Work)
    CateDataSeedLangDif.nganHang: "銀行", // Ginkō (Bank)
    CateDataSeedLangDif.mangXahoi:
        "ソーシャルネットワーク", // Sōsharu nettowāku (Social network)
    CateDataSeedLangDif.hocTap: "学習", // Gakushū (Study)

    //security check
    SecurityCheckLangDef.diemBaoMat:
        "セキュリティスコア", // Sekyuritī sukoa (Security score)
    SecurityCheckLangDef.tongSoTaiKhoan:
        "総アカウント数", // Sō akaunto-kazu (Total accounts)
    SecurityCheckLangDef.tongSoMatKhauManh:
        "総強力なパスワード数", // Sō kyōryoku na pasuwādo-kazu (Total strong passwords)
    SecurityCheckLangDef.tongSoMatKhauYeu:
        "総弱いパスワード数", // Sō yowai pasuwādo-kazu (Total weak passwords)
    SecurityCheckLangDef.tongSoMatKhauGiongNhau:
        "総同じパスワード数", // Sō onaji pasuwādo-kazu (Total same passwords)

    SecurityCheckLangDef.manh: "強力", // Kyōryoku (Strong)
    SecurityCheckLangDef.yeu: "弱い", // Yowai (Weak)
    SecurityCheckLangDef.giongNhau: "同じ", // Onaji (Same)

    SecurityCheckLangDef.capNhatNgayBayGio:
        "今すぐ更新", // Ima sugu kōshin (Update now)
    SecurityCheckLangDef.nhacToiSau: "後で通知", // Ato de tsūchi (Remind me later)
    SecurityCheckLangDef.quanTrong: "重要！", // Jūyō! (Important!)
    SecurityCheckLangDef.hoanTat: "完了", // Kanryō (Complete)
    SecurityCheckLangDef.dangCapNhat: "更新中", // Kōshin-chū (Updating)

    SecurityCheckLangDef.daHieu: "理解しました", // Rikai shimashita (Got it)
    //Khoá bảo mật đã được cập nhật trong phiên bản mới, vui lòng cập nhật để đảm bảo an toàn cho dữ liệu của bạn.
    SecurityCheckLangDef.thongBaoCapNhat:
        "セキュリティキーが新しいバージョンで更新されました。データの安全性を確保するために更新してください。", // Sekyuritī kī ga atarashī bājon de kōshin sa remashita. Dēta no anzen-sei o kakuho suru tame ni kōshin shite kudasai. (The security key has been updated in the new version, please update to ensure the safety of your data.)

    //Bạn cần cập nhật key để tiếp tục sử dụng tính năng này.
    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "この機能を続けるにはキーを更新する必要があります。", // Kono kinō o tsuzukeru ni wa kī o kōshin suru hitsuyō ga arimasu. (You need to update the key to continue using this feature.)
  });
