import '../../model/currency/currency_model.dart';

mixin CurrencyRepository {
  Future<CurrencyModel> getCurrency();
}
