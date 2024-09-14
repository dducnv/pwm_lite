import 'package:cyber_safe/core/service_locator.dart';

enum DependencyInstance {
  nwUsecaseProvider,
  ojbUsecaseProvider,
  ojbAccountUsecase,
  ojbTOTPUsecase,
  ojbCategoryUsecase,
  ojbCustomFieldUsecase,
}

class ServiceLocator {
  static final instance = ServiceLocator._internal();
  ServiceLocator._internal();
  void registerDependencies() {
    registerUsecase();
    registerViewModel();
  }
}
