import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/objectbox_db.dart';

class OjbUsecaseProvider implements UsecaseProvider {
  ObjectboxStack objectboxStack = ObjectboxStack.instance;
  @override
  AccountUsecase getAccountUseCase() {
    return OjbAccountUsecase(
        OjbRepository<AccountOjbModel>(objectboxStack.store),
        OjbRepository<AccountCustomFieldOjbModel>(objectboxStack.store));
  }

  @override
  CategoryUsecase getCategoryUseCase() {
    return OjbCategoryUsecase(
        OjbRepository<CategoryOjbModel>(objectboxStack.store),
        OjbRepository<AccountOjbModel>(objectboxStack.store));
  }

  @override
  AccountCustomFieldUsecase getAccountCustomFieldUseCase() {
    return OjbAccountCustomFieldUsecase(
        OjbRepository<AccountCustomFieldOjbModel>(objectboxStack.store));
  }
}
