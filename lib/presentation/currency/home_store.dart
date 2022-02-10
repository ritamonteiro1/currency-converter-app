import '../../domain/exception/invalid_currency_value_typed_exception.dart';
import '../../domain/model/currency_result/currency_result.dart';
import 'package:flutter/cupertino.dart';
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

  TextEditingController? realController = TextEditingController();

  TextEditingController? dollarController = TextEditingController();

  TextEditingController? eurController = TextEditingController();

  @action
  Future<void> getCurrency(double typedValue, CurrencyType currencyType) async {
    homeState = HomeState.loading;
    try {
      final currency = await getCurrencyUseCase.call(
        typedValue,
        currencyType,
      );
      _setTextEditingControllers(currencyType, currency);
      homeState = HomeState.success;
    } on InvalidCurrencyValueTypedException {
      _clearTextEditingControllers(currencyType);
      homeState = HomeState.invalidCurrencyTypedError;
    } on NullResponseException {
      homeState = HomeState.occurredGenericError;
    } on GenericErrorStatusCodeException {
      homeState = HomeState.occurredGenericError;
    } on Exception {
      homeState = HomeState.occurredNetworkError;
    }
  }

  void _setTextEditingControllers(
      CurrencyType currencyType, CurrencyResult currency) {
    if (currencyType != CurrencyType.euro) {
      eurController?.text = currency.eur.toStringAsFixed(2);
    }
    if (currencyType != CurrencyType.dollar) {
      dollarController?.text = currency.dollar.toStringAsPrecision(2);
    }
    if (currencyType != CurrencyType.real) {
      realController?.text = currency.real.toStringAsPrecision(2);
    }
  }

  void _clearTextEditingControllers(CurrencyType currencyType) {
    if (currencyType == CurrencyType.euro) {
      dollarController?.clear();
      realController?.clear();
    }
    if (currencyType == CurrencyType.dollar) {
      eurController?.clear();
      realController?.clear();
    }
    if (currencyType == CurrencyType.real) {
      eurController?.clear();
      dollarController?.clear();
    }
  }
}
