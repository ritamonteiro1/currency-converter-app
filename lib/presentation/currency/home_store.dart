import 'package:currencyconverter_app/domain/model/currency_result/currency_result.dart';
import 'package:mobx/mobx.dart';

import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/null_response_exception.dart';
import '../../domain/model/currency_type/currency_type.dart';
import '../../domain/use_case/get_currency_use_case.dart';
import 'home_state.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore(
    this.getCurrencyUseCase,
  );

  final GetCurrencyUseCase getCurrencyUseCase;

  @observable
  HomeState homeState = HomeState.initial;

  @observable
  CurrencyResult? currencyResult;

  @action
  Future<void> getCurrency(double typedValue, CurrencyType currencyType) async {
    homeState = HomeState.loading;
    try {
      final currency = await getCurrencyUseCase.getCurrency(
        typedValue,
        currencyType,
      );
      currencyResult = currency;
      homeState = HomeState.success;
    } on NullResponseException {
      homeState = HomeState.occurredGenericError;
    } on GenericErrorStatusCodeException {
      homeState = HomeState.occurredGenericError;
    } on Exception {
      homeState = HomeState.occurredNetworkError;
    }
  }
}
