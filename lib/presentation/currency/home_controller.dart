import 'package:currencyconverter_app/domain/model/currency_result/currency_result.dart';
import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';
import 'package:currencyconverter_app/domain/use_case/get_currency_use_case.dart';

class HomeController {
  HomeController(
    this.getCurrencyUseCase,
  );

  final GetCurrencyUseCase getCurrencyUseCase;

  Future<CurrencyResult> getCurrency(
    double typedValue,
    CurrencyType currencyType,
  ) async {
    final currency = await getCurrencyUseCase.getCurrency(
      typedValue,
      currencyType,
    );
    return currency;
  }
}
