import 'package:cyber_safe/ui/resource/fqa/fqa_model.dart';

List<FQAModel> fqaEn = [
  FQAModel(
    question: "What should I do if I forget my Pin code?",
    answer:
        "If you forget your Pin code, there is no way to retrieve it because your Pin code is not stored anywhere except on your device. The only solution is to delete the data and reset the application. Please regularly back up your data to avoid losing it in case you forget your Pin code.",
  ),
  FQAModel(
    question: 'What is "Add Field"?',
    answer:
        'The "Add Field" button allows you to add any information you want when you create an account.',
  ),
  FQAModel(
    question: "Where is the data after backup stored?",
    answer:
        "Your data is backed up on your device in the Download/cyber_safe folder.",
  ),
  FQAModel(
    question: "Why does the share popup appear when I back up?",
    answer:
        "This feature aims to allow you to store your data in multiple places. You can save it on Google Drive and other cloud services. Your data is encrypted, so rest assured.",
  ),
  FQAModel(
      question: "What is the Pin for the backup file?",
      answer:
          "This feature sets a Pin for your backup file. This Pin is used along with the application lock Pin, ensuring that only you can use the backup file. If the file is lost or falls into someone else's hands, they won't be able to use it without the Pin."),
  FQAModel(
      question: "What is automatic logout?",
      answer:
          "This feature helps you automatically log out of the application after a period of inactivity that you set, protecting your information when you are not using the app."),
  FQAModel(
    question: "What is updating the encryption key and why is it important?",
    answer:
        "The encryption key is a string of characters used to encrypt your data. After a certain period, we provide a security update to change the encryption key, enhancing the security of your data. Note that after the update, all old backup files will be unusable.",
  ),
  FQAModel(
      question: "What is TOTP?",
      answer:
          "TOTP (Time-based One-Time Password) is a one-time password based on time. This code changes after a certain period and is used to authenticate users when logging in. You can add the code by scanning a QR code or manually entering it when creating an account."),
  FQAModel(
    question:
        "Why can't I take screenshots or record the screen of the application?",
    answer:
        "This feature protects your information by preventing screenshots or screen recordings of the application, ensuring that your information is not exposed and preventing third-party applications from stealing your information.",
  ),
  FQAModel(
    question: "If I delete the application, will my data still be there?",
    answer:
        "If you delete the application, all data will be completely erased. If you want to use the application again, please back up your data before deleting the application.",
  ),
];
