import 'package:cyber_safe/ui/resource/fqa/fqa_model.dart';

List<FQAModel> fqaId = [
  FQAModel(
    question: "Apa yang harus saya lakukan jika saya lupa kode PIN saya?",
    answer:
        "Jika Anda lupa kode PIN Anda, tidak ada cara untuk mengambilnya karena kode PIN Anda tidak disimpan di mana pun kecuali di perangkat Anda. Satu-satunya solusi adalah menghapus data dan mengatur ulang aplikasi. Harap secara teratur mencadangkan data Anda untuk menghindari kehilangan jika Anda lupa kode PIN Anda.",
  ),
  FQAModel(
    question: 'Apa itu "Tambah Bidang"?',
    answer:
        'Tombol "Tambah Bidang" memungkinkan Anda menambahkan informasi apa pun yang Anda inginkan saat membuat akun.',
  ),
  FQAModel(
    question: "Di mana data yang dicadangkan disimpan?",
    answer:
        "Data Anda dicadangkan di perangkat Anda di folder Download/cyber_safe.",
  ),
  FQAModel(
    question: "Mengapa popup berbagi muncul saat saya mencadangkan?",
    answer:
        "Fitur ini bertujuan untuk memungkinkan Anda menyimpan data Anda di beberapa tempat. Anda dapat menyimpannya di Google Drive dan layanan cloud lainnya. Data Anda dienkripsi, jadi tenang saja.",
  ),
  FQAModel(
      question: "Apa itu PIN untuk file cadangan?",
      answer:
          "Fitur ini menetapkan PIN untuk file cadangan Anda. PIN ini digunakan bersama dengan PIN kunci aplikasi, memastikan bahwa hanya Anda yang dapat menggunakan file cadangan. Jika file hilang atau jatuh ke tangan orang lain, mereka tidak akan dapat menggunakannya tanpa PIN."),
  FQAModel(
      question: "Apa itu logout otomatis?",
      answer:
          "Fitur ini membantu Anda secara otomatis keluar dari aplikasi setelah periode tidak aktif yang Anda atur, melindungi informasi Anda ketika Anda tidak menggunakan aplikasi."),
  FQAModel(
    question: "Apa itu pembaruan kunci enkripsi dan mengapa penting?",
    answer:
        "Kunci enkripsi adalah string karakter yang digunakan untuk mengenkripsi data Anda. Setelah periode tertentu, kami memberikan pembaruan keamanan untuk mengganti kunci enkripsi, meningkatkan keamanan data Anda. Catatan bahwa setelah pembaruan, semua file cadangan lama tidak akan dapat digunakan.",
  ),
  FQAModel(
      question: "Apa itu TOTP?",
      answer:
          "TOTP (Time-based One-Time Password) adalah kata sandi satu kali berdasarkan waktu. Kode ini berubah setelah periode tertentu dan digunakan untuk mengautentikasi pengguna saat masuk. Anda dapat menambahkan kode dengan memindai kode QR atau memasukkannya secara manual saat membuat akun."),
  FQAModel(
    question:
        "Mengapa saya tidak bisa mengambil tangkapan layar atau merekam layar aplikasi?",
    answer:
        "Fitur ini melindungi informasi Anda dengan mencegah tangkapan layar atau rekaman layar aplikasi, memastikan bahwa informasi Anda tidak terekspos dan mencegah aplikasi pihak ketiga mencuri informasi Anda.",
  ),
  FQAModel(
    question: "Jika saya menghapus aplikasi, apakah data saya masih ada?",
    answer:
        "Jika Anda menghapus aplikasi, semua data akan dihapus sepenuhnya. Jika Anda ingin menggunakan aplikasi lagi, harap cadangkan data Anda sebelum menghapus aplikasi.",
  ),
];
