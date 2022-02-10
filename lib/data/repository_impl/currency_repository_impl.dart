import '../../domain/model/currency/currency_model.dart';
import '../../domain/repository/currency/currency_repository.dart';
import '../remote/currency/data_source/currency_remote_data_source.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  CurrencyRepositoryImpl(
    this.currencyRemoteDataSource,
  );

  final CurrencyRemoteDataSource currencyRemoteDataSource;

  @override
  Future<CurrencyModel> getCurrency() => currencyRemoteDataSource.getCurrency();
}
