import 'package:currencyconverter_app/domain/model/currency_result/currency_result.dart';
import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

mixin GetCurrencyUseCase {
  Future<CurrencyResult> call(
    double typedValue,
    CurrencyType currencyType,
  );
}
