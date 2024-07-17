import 'package:cyber_safe/ui/resource/fqa/fqa_model.dart';

List<FQAModel> fqaPtBr = [
  FQAModel(
    question: "O que devo fazer se esquecer meu código Pin?",
    answer:
        "Se você esquecer seu código Pin, não há como recuperá-lo porque seu código Pin não é armazenado em nenhum lugar além do seu dispositivo. A única solução é excluir os dados e redefinir o aplicativo. Faça backup de seus dados regularmente para evitar perdê-los caso você esqueça seu código Pin.",
  ),
  FQAModel(
    question: 'O que é "Adicionar Campo"?',
    answer:
        'O botão "Adicionar Campo" permite adicionar qualquer informação que você queira ao criar uma conta.',
  ),
  FQAModel(
    question: "Onde os dados são armazenados após o backup?",
    answer:
        "Seus dados são armazenados no seu dispositivo na pasta Download/cyber_safe.",
  ),
  FQAModel(
    question:
        "Por que o pop-up de compartilhamento aparece quando faço backup?",
    answer:
        "Este recurso permite que você armazene seus dados em vários lugares. Você pode salvá-los no Google Drive e em outros serviços de nuvem. Seus dados estão criptografados, então fique tranquilo.",
  ),
  FQAModel(
      question: "O que é o código Pin para o arquivo de backup?", answer: '''
                  Este recurso define um código Pin para o seu arquivo de backup. Este código Pin é usado junto com o código Pin de bloqueio do aplicativo, garantindo que apenas você possa usar o arquivo de backup. Se o arquivo for perdido ou cair nas mãos de outra pessoa, eles não poderão usá-lo sem o código Pin.
  '''),
  FQAModel(question: "O que é logout automático?", answer: '''
                  Este recurso ajuda você a sair automaticamente do aplicativo após um período de inatividade definido por você, protegendo suas informações quando você não estiver usando o aplicativo.
  '''),
  FQAModel(
      question:
          "O que é a atualização da chave de criptografia e por que é importante?",
      answer: '''
                  A chave de criptografia é uma sequência de caracteres usada para criptografar seus dados. Após um determinado período, fornecemos uma atualização de segurança para alterar a chave de criptografia, melhorando a segurança de seus dados. Observe que, após a atualização, todos os arquivos de backup antigos não poderão ser usados.
  '''),
  FQAModel(question: "O que é TOTP?", answer: '''
      TOTP (Time-based One-Time Password) é uma senha única baseada em tempo. Este código muda após um determinado período e é usado para autenticar usuários ao fazer login. Você pode adicionar o código escaneando um código QR ou inserindo manualmente ao criar uma conta.
  '''),
  FQAModel(
      question:
          "Por que não posso tirar capturas de tela ou gravar a tela do aplicativo?",
      answer: '''
      Este recurso protege suas informações impedindo capturas de tela ou gravações da tela do aplicativo, garantindo que suas informações não sejam expostas e evitando que aplicativos de terceiros roubem suas informações.
  '''),
  FQAModel(
      question: "Se eu excluir o aplicativo, meus dados ainda estarão lá?",
      answer: '''
      Se você excluir o aplicativo, todos os dados serão completamente apagados. Se você quiser usar o aplicativo novamente, faça backup de seus dados antes de excluir o aplicativo.
  '''),
];
