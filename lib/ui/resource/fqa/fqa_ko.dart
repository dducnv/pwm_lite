import 'package:cyber_safe/ui/resource/fqa/fqa_model.dart';

List<FQAModel> fqaKo = [
  FQAModel(
    question: "비밀번호를 잊어버렸을 때는 어떻게 해야 하나요?",
    answer:
        "비밀번호를 잊어버리면 복구할 수 있는 방법이 없습니다. 비밀번호는 기기 외부에 저장되지 않기 때문에 데이터를 삭제하고 애플리케이션을 재설정하는 방법밖에 없습니다. 비밀번호를 잊어버렸을 때 데이터 손실을 방지하기 위해 데이터를 정기적으로 백업해 주세요.",
  ),
  FQAModel(
    question: '"필드 추가"는 무엇인가요?',
    answer: "계정을 만들 때 필드 추가 버튼을 사용하여 원하는 정보를 추가할 수 있습니다.",
  ),
  FQAModel(
    question: "백업 후 데이터는 어디에 있나요?",
    answer: "데이터는 기기의 Download/cyber_safe 폴더에 백업됩니다.",
  ),
  FQAModel(
    question: "백업할 때 공유 팝업이 나타나는 이유는 무엇인가요?",
    answer:
        "이 기능은 사용자가 데이터를 여러 장소에 저장할 수 있도록 합니다. Google Drive와 다른 클라우드 서비스에 저장할 수 있습니다. 데이터를 암호화했으므로 안심하세요.",
  ),
  FQAModel(
      question: "백업 파일의 핀 번호는 무엇인가요?",
      answer:
          "이 기능은 백업 파일에 핀 번호를 설정합니다. 이 핀 번호는 애플리케이션 잠금 핀 번호와 함께 사용됩니다. 이 기능을 통해 백업 파일을 사용자만 사용할 수 있습니다. 백업 파일이 분실되거나 다른 사람의 손에 들어가더라도 핀 번호 없이는 사용할 수 없습니다."),
  FQAModel(
      question: "자동 로그아웃은 무엇인가요?",
      answer:
          "이 기능은 설정한 시간이 지나면 사용자가 애플리케이션에서 자동으로 로그아웃되도록 합니다. 애플리케이션을 사용하지 않을 때 정보를 보호합니다."),
  FQAModel(
      question: "암호화 키 업데이트란 무엇이며, 왜 중요한가요?",
      answer:
          "암호화 키는 데이터를 암호화하는 데 사용되는 문자열입니다. 일정 시간이 지나면 보안 업데이트를 제공하여 암호화 키를 변경합니다. 이를 통해 데이터 보안이 강화됩니다. 업데이트 후 이전 백업 파일은 사용할 수 없음을 유의하세요."),
  FQAModel(
      question: "TOTP 코드란 무엇인가요?",
      answer:
          "TOTP(Time-based One-Time Password)는 시간 기반의 일회성 비밀번호입니다. 일정 시간마다 코드가 변경됩니다. 사용자가 로그인할 때 인증하는 데 사용됩니다. 계정을 만들 때 QR 코드를 스캔하거나 수동으로 입력하여 추가할 수 있습니다."),
  FQAModel(
      question: "애플리케이션의 스크린샷과 화면 녹화를 할 수 없는 이유는 무엇인가요?",
      answer:
          "이 기능은 사용자의 정보를 보호합니다. 애플리케이션의 스크린샷이나 화면 녹화를 할 수 없도록 하여 정보 유출을 방지하고 타사 애플리케이션이 정보를 도용하지 못하게 합니다."),
  FQAModel(
      question: "애플리케이션을 삭제하면 데이터는 남아있나요?",
      answer:
          "애플리케이션을 삭제하면 모든 데이터가 완전히 삭제됩니다. 다시 애플리케이션을 사용하려면 애플리케이션을 삭제하기 전에 데이터를 백업해 주세요."),
];
