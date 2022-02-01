import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

import '../../model/currency/currency_model.dart';

mixin CurrencyRepository {
  Future<CurrencyModel> getCurrency(
    double value,
    CurrencyType from,
    CurrencyType to,
  );
}
