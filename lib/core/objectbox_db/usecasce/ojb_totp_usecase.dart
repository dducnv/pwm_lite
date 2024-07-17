import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/objectbox_db.dart';
import 'package:cyber_safe/core/utils.dart';

class OjbTOTPUsecase extends TOTPUsecase {
  final OjbRepository<TOTPOjbModel> _repository;

  OjbTOTPUsecase(this._repository);

  @override
  Future<bool> deleteTOTP(int id) {
    _repository.delete(id);
    return Future.value(true);
  }

  @override
  Future<Result<List<TOTPOjbModel>, Exception>> getAllTOTP() async {
    final query = await _repository.getAll();
    return Future.value(Result(data: query));
  }

  @override
  Future<bool> saveTOTP(TOTPOjbModel totp) {
    _repository.insert(totp);
    return Future.value(true);
  }

  @override
  Future<bool> updateTOTP(TOTPOjbModel totp) {
    _repository.update(totp);
    return Future.value(true);
  }
}
