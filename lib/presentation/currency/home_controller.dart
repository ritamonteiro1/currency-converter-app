import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

import '../../domain/model/currency/currency_model.dart';
import '../../domain/use_case/get_currency_use_case.dart';

class HomeController {
  HomeController(
    this.getCurrencyUseCase,
  );

  final GetCurrencyUseCaseImpl getCurrencyUseCase;

  Future<CurrencyModel> getCurrency(
    double value,
    CurrencyType from,
    CurrencyType to,
  ) async {
    final currency = await getCurrencyUseCase.getCurrency(
      value,
      from,
      to,
    );
    return currency;
  }
}
