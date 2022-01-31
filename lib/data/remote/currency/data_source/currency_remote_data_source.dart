import '../../../../domain/model/currency/currency_model.dart';

mixin CurrencyRemoteDataSource {
  Future<CurrencyModel> getCurrency(double value);
}
