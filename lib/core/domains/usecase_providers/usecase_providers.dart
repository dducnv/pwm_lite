import 'package:cyber_safe/core/domains.dart';

abstract class UsecaseProvider {
  AccountUsecase getAccountUseCase();
  CategoryUsecase getCategoryUseCase();
  AccountCustomFieldUsecase getAccountCustomFieldUseCase();
}
