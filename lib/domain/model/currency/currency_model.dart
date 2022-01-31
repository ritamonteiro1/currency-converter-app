import '../eur/eur_model.dart';
import '../usd/usd_model.dart';

class CurrencyModel {
  CurrencyModel({
    required this.source,
    required this.usd,
    required this.eur,
  });

  final String source;
  final UsdModel usd;
  final EurModel eur;
}
