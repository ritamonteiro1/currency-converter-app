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
  Future<CurrencyResult> getCurrency(
      double value, CurrencyType currencyType) async {
    final currencyModel = await currencyRepository.getCurrency();
    final real = _calculateReal(value, currencyType, currencyModel);
    final dollar = calculateDollar(value, currencyType, currencyModel);
    final eur = calculateEuro(value, currencyType, currencyModel);
    return CurrencyResult(dollar: dollar, real: real, eur: eur);
  }

  double _calculateReal(
      double value, CurrencyType currencyType, CurrencyModel currencyModel) {
    switch (currencyType) {
      case CurrencyType.real:
        return value;
      case CurrencyType.dollar:
        return value * currencyModel.dollar;
      case CurrencyType.euro:
        return value * currencyModel.euro;
    }
  }

  double calculateDollar(
      double value, CurrencyType currencyType, CurrencyModel currencyModel) {
    switch (currencyType) {
      case CurrencyType.real:
        return value * currencyModel.dollar;
      case CurrencyType.dollar:
        return value;
      case CurrencyType.euro:
        return value * currencyModel.dollar / currencyModel.euro;
    }
  }

  double calculateEuro(
      double value, CurrencyType currencyType, CurrencyModel currencyModel) {
    switch (currencyType) {
      case CurrencyType.real:
        return value * currencyModel.euro;
      case CurrencyType.dollar:
        return value * currencyModel.euro / currencyModel.dollar;
      case CurrencyType.euro:
        return value;
    }
  }
}
