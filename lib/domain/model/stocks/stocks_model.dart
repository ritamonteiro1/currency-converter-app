import '../ibovespa/ibovespa_model.dart';

class StocksModel {
  StocksModel({
    required this.ibovespa,
    required this.ifix,
    required this.nasdaq,
    required this.dowjones,
    required this.cac,
    required this.nikkei,
  });

  final IbovespaModel ibovespa;
  final IbovespaModel ifix;
  final IbovespaModel nasdaq;
  final IbovespaModel dowjones;
  final IbovespaModel cac;
  final IbovespaModel nikkei;
}
