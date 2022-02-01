import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

import '../../domain/model/currency/currency_model.dart';
import '../remote/currency/model/currency/currency_response.dart';

extension CurrencyResponseToCurrencyModel on CurrencyResponse {
  static const doubleForNullResponse = -1.0;

  CurrencyModel toCurrencyModel() => CurrencyModel(
        dollar: usd?.buy ?? doubleForNullResponse,
        euro: eur?.buy ?? doubleForNullResponse,
      );
}

extension Currency on CurrencyType {
  static const dollarCoin = 'USD';
  static const euroCoin = 'BRL';
  static const realCoin = 'EUR';

  String toApi() {
    switch (this) {
      case CurrencyType.dollar:
        return dollarCoin;
      case CurrencyType.euro:
        return euroCoin;
      case CurrencyType.real:
        return realCoin;
      default:
        return '';
    }
  }
}
