import 'dart:collection';

import 'package:cyber_safe/ui/resource/language/definitions.dart';

//Tiếng Bồ Đào Nha (Braxin)
HashMap languageBrazilianPortuguese = HashMap<dynamic, String>()
  ..addAll({
    HomeLangDifinition.trangChu: 'Início',
    HomeLangDifinition.taoDanhMuc: 'Criar categoria',
    HomeLangDifinition.tatCa: 'Todos',
    HomeLangDifinition.tenDanhMuc: 'Nome da categoria',
    HomeLangDifinition.nhapTenDanhMuc: 'Digite o nome da categoria',
    HomeLangDifinition.chiTietTaiKhoan: 'Detalhe da conta',
    HomeLangDifinition.suaTaiKhoan: 'Editar conta',
    HomeLangDifinition.xoaTaiKhoan: 'Excluir conta',
    HomeLangDifinition.nhanNut: 'Clique',
    HomeLangDifinition.deThemTaiKhoan: 'para adicionar nova conta',
    HomeLangDifinition.timKiem: 'Buscar',
    HomeLangDifinition.hintSearch:
        'Digite o nome do app ou usuário para buscar',
    HomeLangDifinition.chinhSachBaoMat: 'Política de privacidade',
    HomeLangDifinition.dieuKhoanDichVu: 'Termos de serviço',
    HomeLangDifinition.giayPhepVaPhapLy: 'Licença e legal',
    HomeLangDifinition.danhGiaUngDung: 'Avaliar app',
    HomeLangDifinition.quanLyTotp: 'Gerenciar TOTPs',
    HomeLangDifinition.dongYVoiChinhSachVaDieuKhoan:
        'Concordo com a política de privacidade e os termos de serviço',
    HomeLangDifinition.tiepTuc: 'Continuar',
    HomeLangDifinition.chaoMungDenVoi: 'Bem-vindo ao',
    HomeLangDifinition.chonNgonNgu: 'Escolher idioma',
    HomeLangDifinition.saoChepUsername: 'Copiar nome de usuário',
    HomeLangDifinition.saoChepMatKhau: 'Copiar senha',
    HomeLangDifinition.saoChepThanhCong: 'Copiado com sucesso',
    HomeLangDifinition.chonTaiKhoan: 'Selecionar conta',
    HomeLangDifinition.boChonTaiKhoan: 'Desselecionar conta',
    HomeLangDifinition.doiDanhMuc: 'Mudar categoria',
    HomeLangDifinition.banCoDongYXoaCacTaiKhoanDaChonKhong:
        'Tem certeza de que deseja excluir as contas selecionadas?',
    HomeLangDifinition.taoMatKhau: 'Gerador de senhas',
    HomeLangDifinition.saoChep: 'Copiar',
    HomeLangDifinition.suDung: 'Usar',
    HomeLangDifinition.quayLai: 'Voltar',
    HomeLangDifinition.kyHieu: 'Símbolos',
    HomeLangDifinition.so: 'Números',
    HomeLangDifinition.kiemTraBaoMat: 'Verificação de segurança',
    HomeLangDifinition.gioiThieu: 'Sobre o CyberSafe',
    HomeLangDifinition.nhaPhatTrien: 'Desenvolvedor',
    HomeLangDifinition.yeuCauTinhNang: 'Solicitação de recurso',
    HomeLangDifinition.cauHoiThuongGap: 'Perguntas frequentes',

    //createAccount
    CreateAccountLangDif.taoTaiKhoan: "Criar conta",
    CreateAccountLangDif.capNhatTaiKhoan: "Atualizar conta",
    CreateAccountLangDif.tenUngdung: "Nome da aplicação",
    CreateAccountLangDif.tenTaiKhoan: "Nome de usuário",
    CreateAccountLangDif.matKhau: "Senha",
    CreateAccountLangDif.tenTruong: "Nome do campo",
    CreateAccountLangDif.ghiChu: "Notas",
    CreateAccountLangDif.khoaXacThucHaiLop: "Chave autenticadora TOTP",
    CreateAccountLangDif.themKhoaXacThucHaiLop: "Adicionar chave TOTP",
    CreateAccountLangDif.vanBan: "Texto público",
    CreateAccountLangDif.vanBanBaoMat: "Texto privado",
    CreateAccountLangDif.themKhoa: "Adicionar chave",
    CreateAccountLangDif.themTruong: "Adicionar campo",
    CreateAccountLangDif.chonDanhMuc: "Escolher categoria",
    CreateAccountLangDif.tenDanhMuc: "Nome da categoria",
    CreateAccountLangDif.nhapTenDanhMuc: "Digite o nome da categoria",
    CreateAccountLangDif.themDanhMuc: "Criar categoria",
    CreateAccountLangDif.nhapKhoaXacThucTOTP: "Digite a chave TOTP",
    CreateAccountLangDif.keyKhongHopLe:
        "Chave inválida, por favor, tente novamente!",
    CreateAccountLangDif.thongBao: "Notificação",
    CreateAccountLangDif.vuiLongChonDanhMuc: "Por favor, escolha a categoria",
    CreateAccountLangDif.dong: "Fechar",
    CreateAccountLangDif.vuiLongNhapTenUngDung:
        "Por favor, insira o nome da aplicação",
    CreateAccountLangDif.doiIcon: "Mudar ícone",
    CreateAccountLangDif.khongChon: "Não selecionado",
    CreateAccountLangDif.chonIcon: "Escolher ícone",
    CreateAccountLangDif.kieuDuLieu: "Tipo de dado",
    CreateAccountLangDif.tenDangNhap: "Nome de usuário",
    CreateAccountLangDif.vuiLongNhapTenTruong:
        "Por favor, insira o nome do campo",
    CreateAccountLangDif.banCoMuonMatKhauMoiGhiDeLenMatKhauCu:
        "Você quer sobrescrever a senha antiga com uma nova?",
    CreateAccountLangDif.dongY: "Concordar",

    //detail account
    DetailsAccountLangDef.danhMuc: "Categoria",
    DetailsAccountLangDef.ghiChu: "Notas",
    DetailsAccountLangDef.maXacThucTOTP: "Código autenticador TOTP",
    DetailsAccountLangDef.thongTinTaiKhoan: "Informações da conta",
    DetailsAccountLangDef.thongTinTuyChinh: "Informações personalizadas",
    DetailsAccountLangDef.sua: "Editar",
    DetailsAccountLangDef.luu: "Salvar",
    DetailsAccountLangDef.matKhau: "Senha",
    DetailsAccountLangDef.tenTaiKhoan: "Nome de usuário",
    DetailsAccountLangDef.banCoChacChanMuonXoaTaiKhoanNay:
        "Tem certeza de que deseja excluir esta conta?",
    DetailsAccountLangDef.xoaTaiKhoan: "Excluir conta",
    DetailsAccountLangDef.xoaTaiKhoanThanhCong: "Conta excluída com sucesso",
    DetailsAccountLangDef.xoaTaiKhoanThatBai: "Falha ao excluir a conta",
    DetailsAccountLangDef.dong: "Fechar",
    DetailsAccountLangDef.capNhatMatKhauLanCuoi: "Última senha",
    DetailsAccountLangDef.lichSuMatKhau: "Histórico de senhas",
    DetailsAccountLangDef.chiTiet: "Detalhe",
    DetailsAccountLangDef.capNhatVao: "Atualizado em",

    //category manager
    CateManagerLangDef.quanLyDanhMuc: "Gerenciador de categorias",
    CateManagerLangDef.capNhatDanhMuc: "Atualizar categoria",
    CateManagerLangDef.luuYHuongDan:
        "Nota: Pressione e segure, arraste e solte para reordenar a lista de categorias.",
    CateManagerLangDef.xoa: "Excluir",
    CateManagerLangDef.huy: "Cancelar",
    CateManagerLangDef.xoaDanhMuc: "Excluir categoria",
    CateManagerLangDef.banCoChacChanMuonXoaDanhMucNay:
        "Tem certeza de que deseja excluir esta categoria?",
    CateManagerLangDef.danhMucNayChuaTaiKhoanHayCanNacTruocKhiXoa:
        "Esta categoria contém contas, por favor, exclua-as antes de excluir esta categoria.",
    CateManagerLangDef.xemDanhSachTaiKhoanTrongDanhMuc:
        "Ver lista de contas nesta categoria",
    //local auth
    LocalAuthLangDef.taoMaPin: "Criar seu código PIN",
    LocalAuthLangDef.xacNhanMaPin: "Confirmar seu código PIN",
    LocalAuthLangDef.dangNhapVoiMaPin: "Login com seu código PIN",
    LocalAuthLangDef.vuiLongNhapDayDuMaPin:
        "Por favor, insira o código PIN completo",
    LocalAuthLangDef.nhapMaPin: "Digite o código PIN",
    LocalAuthLangDef.nhapMaPinCuaFileSaoLuu:
        "Digite o código PIN do arquivo de backup",
    LocalAuthLangDef.nhapMaPinMoi: "Digite novo código PIN",

    //setting
    SettingLangDef.caiDat: "Configurações",
    SettingLangDef.doiNgonNgu: "Alterar idioma",
    SettingLangDef.tuyChinhGiaoDien: "Alterar modo de tema",
    SettingLangDef.giaoDienSang: "Tema claro",
    SettingLangDef.giaoDienToi: "Tema escuro",
    SettingLangDef.heThong: "Sistema",
    SettingLangDef.themDuLieuTuGooglePasswordManager:
        "Importar do Gerenciador de Senhas do Google",
    SettingLangDef.khongCoDuLieuDeSaoLuu: "Sem dados para backup",
    SettingLangDef.thoiGianKhoaTuDong: "Tempo de bloqueio automático",
    SettingLangDef.phut: "minutos",
    SettingLangDef.xacNhan: "Confirmar",
    SettingLangDef.themDuLieuTuTrinhDuyet: "Importar do navegador",
    SettingLangDef.khoaSinhTracHoc: "Bloqueio biométrico",
    SettingLangDef.saoLuuDuLieu: "Backup de dados",
    SettingLangDef.khoiPhucDuLieu: "Restaurar dados",
    SettingLangDef.khongCoQuyenTruyCap: "Sem permissão de acesso",
    SettingLangDef.fileSaoLuuDaDuocLuuVaoThuMucTaiXuong:
        "O arquivo de backup foi salvo na pasta de downloads",
    SettingLangDef.coLoiXayRaKhiSaoLuuDuLieu:
        "Ocorreu um erro ao fazer backup dos dados",
    SettingLangDef.khongCoFileNaoDuocChon: "Nenhum arquivo selecionado",
    SettingLangDef.fileKhongDungDinhDang: "Arquivo não está no formato correto",
    SettingLangDef.khoiPhucDuLieuThanhCong: "Recuperação de dados bem-sucedida",
    SettingLangDef.khoiPhucDuLieuThatBai: "Falha ao recuperar dados",
    SettingLangDef.thoiGianTuDongDangXuat: "Tempo de logout automático",
    SettingLangDef.maPinChoFileSaoLuu: "Código PIN para arquivo de backup",
    SettingLangDef.doiMaPin: "Alterar código PIN",
    SettingLangDef.caiDatChung: "Configurações gerais",
    SettingLangDef.baoMat: "Segurança",
    SettingLangDef.quanLyDuLieu: "Gerenciamento de dados",
    SettingLangDef.doiMaPinThanhCong: "Código PIN alterado com sucesso",

    //cate data seed
    CateDataSeedLangDif.congViec: "Trabalhos",
    CateDataSeedLangDif.nganHang: "Bancos",
    CateDataSeedLangDif.mangXahoi: "Redes sociais",
    CateDataSeedLangDif.hocTap: "Contas educacionais",

    //security check
    SecurityCheckLangDef.diemBaoMat: "Pontuação de segurança",
    SecurityCheckLangDef.tongSoTaiKhoan: "Total de contas",
    SecurityCheckLangDef.tongSoMatKhauManh: "Total de senhas fortes",
    SecurityCheckLangDef.tongSoMatKhauYeu: "Total de senhas fracas",
    SecurityCheckLangDef.tongSoMatKhauGiongNhau: "Total de senhas iguais",

    SecurityCheckLangDef.manh: "Forte",
    SecurityCheckLangDef.yeu: "Fraca",
    SecurityCheckLangDef.giongNhau: "Mesma",
    SecurityCheckLangDef.quanTrong: "Importante!",
    SecurityCheckLangDef.capNhatNgayBayGio: "Atualizar agora",
    SecurityCheckLangDef.dangCapNhat: "Atualizando",
    SecurityCheckLangDef.nhacToiSau: "Lembrar mais tarde",
    SecurityCheckLangDef.hoanTat: "Concluído",
    SecurityCheckLangDef.daHieu: "Entendi",

    SecurityCheckLangDef.thongBaoCapNhat:
        "A chave de segurança foi atualizada na nova versão, por favor, atualize para garantir a segurança dos seus dados.",

    SecurityCheckLangDef.thongBaoYeuCauCapNhat:
        "Você precisa atualizar a chave para continuar usando este recurso.",
  });
