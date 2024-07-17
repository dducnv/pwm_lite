import 'package:secure_application/secure_application.dart';

class SecureApplicationUtil {
  static final instance = SecureApplicationUtil._internal();

  SecureApplicationUtil._internal();

  SecureApplicationController? secureApplicationController;

  Future<void> init() async {
    secureApplicationController = SecureApplicationController(
      SecureApplicationState(),
    );
    if (secureApplicationController != null) {
      if (secureApplicationController?.secured == false) {
        secureApplicationController?.secure();
        secureApplicationController?.pause();
      }
    }
  }

  void lock() {
    secureApplicationController?.lock();
  }

  void unlock() {
    secureApplicationController?.unlock();
  }

  void dispose() {
    secureApplicationController?.dispose();
  }
}
