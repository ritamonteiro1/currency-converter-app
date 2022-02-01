import 'package:dio/dio.dart';

import '../../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../../domain/exception/null_response_exception.dart';
import '../../../../domain/model/currency/currency_model.dart';
import '../../../../domain/model/currency_type/currency_type.dart';
import '../../../mapper/remote_to_model.dart';
import '../model/currency_converter/currency_converter_response.dart';
import 'currency_remote_data_source.dart';

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  CurrencyRemoteDataSourceImpl(
    this._dio,
  );

  final Dio _dio;
  static const _baseUrl = 'https://api.hgbrasil.com/finance?format=';

  @override
  Future<CurrencyModel> getCurrency(
    double value,
    CurrencyType from,
    CurrencyType to,
  ) async {
    final currencyType = '${from.toApi()}${to.toApi}';
    try {
      final response = await _dio.get('$_baseUrl$currencyType');
      final currencyConverterResponse =
          CurrencyConverterResponse.fromJson(response.data);
      final resultResponse = currencyConverterResponse.result;
      final currencyResponse = resultResponse?.currency;
      final currencyModel = currencyResponse?.toCurrencyModel();
      if (currencyModel != null) {
        return currencyModel;
      } else {
        throw NullResponseException();
      }
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw Exception();
      }
    }
  }
}
