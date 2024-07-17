import 'package:local_auth/local_auth.dart';
import 'package:cyber_safe/core/utils.dart';

class LocalAuthConfig {
  static final instance = LocalAuthConfig._internal();

  LocalAuthConfig._internal();

  final LocalAuthentication auth = LocalAuthentication();
  bool? _canCheckBiometrics;
  bool? _isOpenUseBiometric;
  List<BiometricType>? _availableBiometrics;

  bool get isAvailableBiometrics =>
      _canCheckBiometrics! && _availableBiometrics!.isNotEmpty;

  bool get isOpenUseBiometric => _isOpenUseBiometric!;

  List<BiometricType> get availableBiometrics => _availableBiometrics!;

  Future<void> init() async {
    await canCheckBiometrics;
    await getAvailableBiometrics();
    await openUseBiometric();
  }

  Future<bool> get canCheckBiometrics async {
    if (_canCheckBiometrics != null) {
      return _canCheckBiometrics!;
    }
    bool? canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
    }
    _canCheckBiometrics = canCheckBiometrics;
    return _canCheckBiometrics!;
  }

  Future<void> openUseBiometric() async {
    String? enableLocalAuth = await SecureStorage.instance
        .read(SecureStorageKeys.isEnableLocalAuth.name);
    if (enableLocalAuth == null || enableLocalAuth == "false") {
      _isOpenUseBiometric = false;
    } else {
      _isOpenUseBiometric = true;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    if (_availableBiometrics != null) {
      return _availableBiometrics!;
    }
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
    }
    _availableBiometrics = availableBiometrics;
    return _availableBiometrics!;
  }

  Future<bool> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } catch (e) {
      customLogger(msg: e.toString(), typeLogger: TypeLogger.error);
    }
    return authenticated;
  }
}
