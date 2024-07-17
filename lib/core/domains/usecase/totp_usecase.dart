import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/utils.dart';

abstract class TOTPUsecase {
  Future<bool> saveTOTP(TOTPOjbModel totp);
  Future<bool> deleteTOTP(int id);
  Future<bool> updateTOTP(TOTPOjbModel totp);

  Future<Result<List<TOTPOjbModel>, Exception>> getAllTOTP();
}
