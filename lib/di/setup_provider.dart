import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/remote/currency/data_source/currency_remote_data_source.dart';
import '../data/remote/currency/data_source/currency_remote_data_source_impl.dart';
import '../domain/repository/currency/currency_repository.dart';
import '../domain/repository/currency/currency_repository_impl.dart';
import '../domain/use_case/get_currency_use_case.dart';
import '../domain/use_case/get_currency_use_case_impl.dart';
import '../main/my_app.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

Dio dio = Dio();

List<SingleChildWidget> independentServices = [
  Provider.value(value: const MyApp()),
  Provider.value(
      value: dio.interceptors.add(LogInterceptor(responseBody: true))),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Dio, CurrencyRemoteDataSource>(
    update: (_, dio, __) => CurrencyRemoteDataSourceImpl(dio),
  ),
  ProxyProvider<CurrencyRemoteDataSource, CurrencyRepository>(
    update: (_, currencyRemoteDataSource, __) =>
        CurrencyRepositoryImpl(currencyRemoteDataSource),
  ),
  ProxyProvider<CurrencyRepository, GetCurrencyUseCase>(
    update: (_, currencyRepository, __) =>
        GetCurrencyUseCaseImpl(currencyRepository),
  ),
];
