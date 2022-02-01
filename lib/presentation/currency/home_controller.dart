import 'package:currencyconverter_app/domain/model/currency_result/currency_result.dart';
import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

import '../../domain/use_case/get_currency_use_case_impl.dart';

class HomeController {
  HomeController(
    this.getCurrencyUseCase,
  );

  final GetCurrencyUseCaseImpl getCurrencyUseCase;

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
