import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/objectbox_db.dart';
import 'package:cyber_safe/core/service_locator.dart';
import 'package:cyber_safe/main.dart';

extension RegisterUsecase on ServiceLocator {
  void registerUsecase() {
    locator.registerLazySingleton<UsecaseProvider>(() => OjbUsecaseProvider(),
        instanceName: DependencyInstance.ojbUsecaseProvider.name);

    locator.registerFactory<AccountUsecase>(
        () => locator
            .get<UsecaseProvider>(
              instanceName: DependencyInstance.ojbUsecaseProvider.name,
            )
            .getAccountUseCase(),
        instanceName: DependencyInstance.ojbAccountUsecase.name);

    locator.registerFactory<CategoryUsecase>(
        () => locator
            .get<UsecaseProvider>(
                instanceName: DependencyInstance.ojbUsecaseProvider.name)
            .getCategoryUseCase(),
        instanceName: DependencyInstance.ojbCategoryUsecase.name);

    locator.registerFactory<TOTPUsecase>(
        () => locator
            .get<UsecaseProvider>(
              instanceName: DependencyInstance.ojbUsecaseProvider.name,
            )
            .getTOTPUseCase(),
        instanceName: DependencyInstance.ojbTOTPUsecase.name);

    locator.registerFactory<AccountCustomFieldUsecase>(
        () => locator
            .get<UsecaseProvider>(
              instanceName: DependencyInstance.ojbUsecaseProvider.name,
            )
            .getAccountCustomFieldUseCase(),
        instanceName: DependencyInstance.ojbCustomFieldUsecase.name);
  }
}
