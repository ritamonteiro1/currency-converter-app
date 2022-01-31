import '../model/currency/currency_model.dart';

mixin GetCurrencyUseCase {
  Future<CurrencyModel> getCurrency();
}
