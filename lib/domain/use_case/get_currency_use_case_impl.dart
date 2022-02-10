import 'package:currencyconverter_app/domain/model/currency_result/currency_result.dart';
import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

import '../model/currency/currency_model.dart';
import '../repository/currency/currency_repository.dart';
import 'get_currency_use_case.dart';

class GetCurrencyUseCaseImpl implements GetCurrencyUseCase {
  GetCurrencyUseCaseImpl(
    this.currencyRepository,
  );

  final CurrencyRepository currencyRepository;

  @override
  Future<CurrencyResult> call(
      double typedValue, CurrencyType currencyType) async {
    final currencyModel = await currencyRepository.getCurrency();
    final real = _calculateReal(typedValue, currencyType, currencyModel);
    final dollar = _calculateDollar(typedValue, currencyType, currencyModel);
    final eur = _calculateEuro(typedValue, currencyType, currencyModel);
    return CurrencyResult(dollar: dollar, real: real, eur: eur);
  }

  double _calculateReal(double typedValue, CurrencyType currencyType,
      CurrencyModel currencyModel) {
    switch (currencyType) {
      case CurrencyType.real:
        return typedValue;
      case CurrencyType.dollar:
        return typedValue * currencyModel.dollarInReal;
      case CurrencyType.euro:
        return typedValue * currencyModel.euroInReal;
    }
  }

  double _calculateDollar(double typedValue, CurrencyType currencyType,
      CurrencyModel currencyModel) {
    switch (currencyType) {
      case CurrencyType.real:
        return typedValue / currencyModel.dollarInReal;
      case CurrencyType.dollar:
        return typedValue;
      case CurrencyType.euro:
        return typedValue *
            currencyModel.dollarInReal /
            currencyModel.euroInReal;
    }
  }

  double _calculateEuro(double typedValue, CurrencyType currencyType,
      CurrencyModel currencyModel) {
    switch (currencyType) {
      case CurrencyType.real:
        return typedValue / currencyModel.euroInReal;
      case CurrencyType.dollar:
        return typedValue *
            currencyModel.euroInReal /
            currencyModel.dollarInReal;
      case CurrencyType.euro:
        return typedValue;
    }
  }
}
