import 'package:cyber_safe/core/utils.dart';

class Result<Success, Failure> {
  late Success? data;
  late Failure? error;

  Result({this.data, this.error});

  bool get isSuccess => data != null && error == null;

  Result<T, Failure> to<T>(TypeToTypeHandle<Success, T> typeToTypeHandle) {
    if (isSuccess) {
      return Result(data: typeToTypeHandle(data as Success));
    } else {
      return Result(error: error);
    }
  }
}
