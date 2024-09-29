import 'package:cyber_safe/ui/resource/fqa/fqa_model.dart';

List<FQAModel> fqaMs = [
  FQAModel(
    question: "Apa yang harus saya lakukan jika saya lupa kod PIN saya?",
    answer:
        "Jika anda lupa kod PIN anda, tidak ada cara untuk memulihkannya kerana kod PIN anda tidak disimpan di mana-mana kecuali pada peranti anda. Satu-satunya penyelesaian adalah untuk memadamkan data dan menetapkan semula aplikasi. Sila buat salinan sandaran data anda secara berkala untuk mengelakkan kehilangan jika anda terlupa kod PIN anda.",
  ),
  FQAModel(
    question: 'Apa itu "Tambah Medan"?',
    answer:
        'Butang "Tambah Medan" membolehkan anda menambah apa-apa maklumat yang anda mahu semasa anda mencipta akaun.',
  ),
  FQAModel(
    question: "Di manakah data disimpan selepas sandaran?",
    answer:
        "Data anda disandarkan pada peranti anda dalam folder Download/cyber_safe.",
  ),
  FQAModel(
    question: "Mengapa pop-up kongsi muncul apabila saya membuat sandaran?",
    answer:
        "Ciri ini bertujuan untuk membolehkan anda menyimpan data anda di pelbagai tempat. Anda boleh menyimpannya di Google Drive dan perkhidmatan awan lain. Data anda disulitkan, jadi jangan risau.",
  ),
  FQAModel(
      question: "Apakah PIN untuk fail sandaran?",
      answer:
          "Ciri ini menetapkan PIN untuk fail sandaran anda. PIN ini digunakan bersama dengan PIN kunci aplikasi, memastikan bahawa hanya anda yang boleh menggunakan fail sandaran. Jika fail itu hilang atau jatuh ke tangan orang lain, mereka tidak akan dapat menggunakannya tanpa PIN."),
  FQAModel(
      question: "Apakah logout automatik?",
      answer:
          "Ciri ini membantu anda secara automatik log keluar dari aplikasi selepas tempoh tidak aktif yang anda tetapkan, melindungi maklumat anda apabila anda tidak menggunakan aplikasi."),
  FQAModel(
    question: "Apakah kemas kini kunci penyulitan dan mengapa ia penting?",
    answer:
        "Kunci penyulitan adalah rentetan watak yang digunakan untuk menyulitkan data anda. Selepas tempoh tertentu, kami menyediakan kemas kini keselamatan untuk menukar kunci penyulitan, meningkatkan keselamatan data anda. Perlu diingat bahawa selepas kemas kini, semua fail sandaran lama tidak akan dapat digunakan.",
  ),
  FQAModel(
      question: "Apa itu TOTP?",
      answer:
          "TOTP (Kata Laluan Sekali Guna Berasaskan Masa) adalah kata laluan sekali guna berdasarkan masa. Kod ini berubah selepas tempoh tertentu dan digunakan untuk mengesahkan pengguna semasa log masuk. Anda boleh menambah kod tersebut dengan mengimbas kod QR atau memasukkannya secara manual semasa mencipta akaun."),
  FQAModel(
    question:
        "Mengapa saya tidak boleh mengambil tangkapan skrin atau merakam skrin aplikasi?",
    answer:
        "Ciri ini melindungi maklumat anda dengan menghalang tangkapan skrin atau rakaman skrin aplikasi, memastikan bahawa maklumat anda tidak terdedah dan mencegah aplikasi pihak ketiga daripada mencuri maklumat anda.",
  ),
  FQAModel(
    question: "Jika saya memadam aplikasi, adakah data saya masih ada?",
    answer:
        "Jika anda memadam aplikasi, semua data akan dipadamkan sepenuhnya. Jika anda ingin menggunakan aplikasi itu semula, sila buat salinan sandaran data anda sebelum memadam aplikasi.",
  ),
];
