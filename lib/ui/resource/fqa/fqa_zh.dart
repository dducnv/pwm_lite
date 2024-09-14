import 'package:cyber_safe/ui/resource/fqa/fqa_model.dart';

List<FQAModel> fqaZH = [
  FQAModel(
    question: "如果我忘记了PIN码，我该怎么办？",
    answer:
        "如果您忘记了PIN码，没有办法找回，因为您的PIN码只存储在您的设备上，无法在其他地方找到。唯一的解决办法是删除数据并重置应用程序。请定期备份您的数据，以防止忘记PIN码时丢失数据。",
  ),
  FQAModel(
    question: '"添加字段"是什么？',
    answer: "当您创建一个账户时，使用添加字段按钮可以添加您想要的任何信息。",
  ),
  FQAModel(
    question: "备份后的数据存储在哪里？",
    answer: "您的数据备份在设备上的Download/cyber_safe文件夹中。",
  ),
  FQAModel(
    question: "为什么备份时会出现分享弹出窗口？",
    answer: "此功能旨在让您可以在多个地方存储您的数据。您可以将其保存在Google Drive和其他云服务上。您的数据已加密，请放心。",
  ),
  FQAModel(
      question: "备份文件的PIN码是什么？",
      answer:
          "此功能为您的备份文件设置一个PIN码。此PIN码与应用程序锁定的PIN码一起使用，确保只有您可以使用备份文件。如果文件丢失或落入他人手中，没有PIN码他们将无法使用。"),
  FQAModel(
      question: "自动登出是什么？",
      answer: "此功能帮助您在一段时间不活动后自动登出应用程序，保护您在不使用应用程序时的信息安全。"),
  FQAModel(
      question: "更新加密密钥是什么，为什么重要？",
      answer:
          "加密密钥是一串用于加密数据的字符。经过一段时间后，我们会提供安全更新以更改加密密钥，提高您的数据安全性。请注意，更新后所有旧的备份文件将无法使用。"),
  FQAModel(
      question: "什么是TOTP？",
      answer:
          "TOTP（基于时间的一次性密码）是一种基于时间的一次性密码。此代码在一定时间后会更改，用于用户登录时的身份验证。您可以在创建账户时通过扫描二维码或手动输入来添加此代码。"),
  FQAModel(
      question: "为什么我不能截屏或录屏应用程序？",
      answer: "此功能通过阻止截屏或录屏应用程序来保护您的信息，确保您的信息不被泄露，并防止第三方应用程序窃取您的信息。"),
  FQAModel(
      question: "如果我删除应用程序，数据还会保留吗？",
      answer: "如果您删除应用程序，所有数据将被完全删除。如果您想再次使用应用程序，请在删除应用程序之前备份您的数据。"),
];
