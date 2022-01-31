import 'package:dio/dio.dart';

import 'currency_remote_data_source.dart';

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  CurrencyRemoteDataSourceImpl(
    this._dio,
  );

  final Dio _dio;
}
