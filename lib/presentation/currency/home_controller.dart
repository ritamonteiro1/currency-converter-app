import '../../domain/model/currency/currency_model.dart';
import '../../domain/use_case/get_currency_use_case.dart';

class HomeController {
  HomeController(
    this.getCurrencyUseCase,
  );

  final GetCurrencyUseCaseImpl getCurrencyUseCase;

  Future<CurrencyModel> getCurrency(double value) async {
    final currency = await getCurrencyUseCase.getCurrency(value);
    return currency;
  }
}
