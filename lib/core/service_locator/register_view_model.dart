import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/service_locator.dart';
import 'package:cyber_safe/main.dart';
import 'package:cyber_safe/ui/screens.dart';

extension RegisterViewModel on ServiceLocator {
  void registerViewModel() {
    // Register "Home" view model
    locator.registerFactory<HomeViewModel>(
      () => HomeViewModel(
        totpUsecase: locator.get<TOTPUsecase>(
            instanceName: DependencyInstance.ojbTOTPUsecase.name),
        sqlCategoryUsecase: locator.get<CategoryUsecase>(
            instanceName: DependencyInstance.ojbCategoryUsecase.name),
        sqlAccountUsecase: locator.get<AccountUsecase>(
            instanceName: DependencyInstance.ojbAccountUsecase.name),
      ),
    );

    // Register "Setting" view model
    locator.registerFactory<SettingViewModel>(
      () => SettingViewModel(
        categoryUsecase: locator.get<CategoryUsecase>(
            instanceName: DependencyInstance.ojbCategoryUsecase.name),
        accountUsecase: locator.get<AccountUsecase>(
            instanceName: DependencyInstance.ojbAccountUsecase.name),
      ),
    );

    // Register "CreateAccount" view model
    locator.registerFactory<CreateAccountViewModel>(
      () => CreateAccountViewModel(
        categoryUsecase: locator.get<CategoryUsecase>(
            instanceName: DependencyInstance.ojbCategoryUsecase.name),
        accountUsecase: locator.get<AccountUsecase>(
            instanceName: DependencyInstance.ojbAccountUsecase.name),
        accountCustomFieldUsecase: locator.get<AccountCustomFieldUsecase>(
            instanceName: DependencyInstance.ojbCustomFieldUsecase.name),
        totpUsecase: locator.get<TOTPUsecase>(
            instanceName: DependencyInstance.ojbTOTPUsecase.name),
      ),
    );

    locator.registerFactory<DetailsAccountViewModel>(
      () => DetailsAccountViewModel(
        accountUsecase: locator.get<AccountUsecase>(
            instanceName: DependencyInstance.ojbAccountUsecase.name),
        categoryUsecase: locator.get<CategoryUsecase>(
            instanceName: DependencyInstance.ojbCategoryUsecase.name),
      ),
    );

    locator.registerFactory<UpdateAccountViewModel>(
      () => UpdateAccountViewModel(
        accountUsecase: locator.get<AccountUsecase>(
            instanceName: DependencyInstance.ojbAccountUsecase.name),
        categoryUsecase: locator.get<CategoryUsecase>(
            instanceName: DependencyInstance.ojbCategoryUsecase.name),
        totpUsecase: locator.get<TOTPUsecase>(
            instanceName: DependencyInstance.ojbTOTPUsecase.name),
      ),
    );

    locator.registerFactory<CategoryManagerViewModel>(
      () => CategoryManagerViewModel(
        locator.get<CategoryUsecase>(
            instanceName: DependencyInstance.ojbCategoryUsecase.name),
      ),
    );
    locator.registerFactory<TOTPViewModel>(
      () => TOTPViewModel(
        totpUsecase: locator.get<TOTPUsecase>(
            instanceName: DependencyInstance.ojbTOTPUsecase.name),
      ),
    );

    locator.registerFactory<PassGenViewModel>(() => PassGenViewModel());

    locator.registerFactory<SecurityCheckViewModel>(
      () => SecurityCheckViewModel(
        accountUsecase: locator.get<AccountUsecase>(
            instanceName: DependencyInstance.ojbAccountUsecase.name),
        categoryUsecase: locator.get<CategoryUsecase>(
            instanceName: DependencyInstance.ojbCategoryUsecase.name),
      ),
    );

    locator.registerFactory<LocalAuthViewModel>(() => LocalAuthViewModel());
    locator.registerFactory<RegisterScreenViewModel>(
        () => RegisterScreenViewModel());
  }
}
