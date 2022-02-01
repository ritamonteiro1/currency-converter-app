import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

import '../../../../domain/model/currency/currency_model.dart';

mixin CurrencyRemoteDataSource {
  Future<CurrencyModel> getCurrency(
    double value,
    CurrencyType from,
    CurrencyType to,
  );
}
