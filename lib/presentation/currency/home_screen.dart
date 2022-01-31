import '../../domain/model/currency/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../data/remote/currency/data_source/currency_remote_data_source.dart';
import '../../data/remote/currency/data_source/currency_remote_data_source_impl.dart';
import '../../domain/repository/currency/currency_repository.dart';
import '../../domain/repository/currency/currency_repository_impl.dart';
import '../../domain/use_case/get_currency_use_case.dart';
import '../../generated/l10n.dart';
import 'currency_custom_text_field.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CurrencyRemoteDataSource currencyRemoteDataSource;
  late CurrencyRepository currencyRepository;
  late GetCurrencyUseCaseImpl getCurrencyUseCase;
  late HomeController homeController;
  late CurrencyModel currencyModel;
  double? eur;
  double? dollar;

  @override
  void initState() {
    super.initState();
    currencyRemoteDataSource = CurrencyRemoteDataSourceImpl(Dio());
    currencyRepository = CurrencyRepositoryImpl(currencyRemoteDataSource);
    getCurrencyUseCase = GetCurrencyUseCaseImpl(currencyRepository);
    homeController = HomeController(getCurrencyUseCase);
  }

  Future<void> getCurrency(double real) async {
    currencyModel = await homeController.getCurrency(real);
    setCurrencies(currencyModel);
  }

  void setCurrencies(CurrencyModel currencyModel) {
    setState(() {
      eur = currencyModel.eur.buy;
      dollar = currencyModel.usd.buy;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(S.of(context).homeScreenCurrencyConverterText),
          leading: const Image(
            image: AssetImage(
              ConstantImages.logoIoasys,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 38,
            vertical: 50,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    ConstantImages.currencyConverter,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenRealPrefixTextField,
                  labelText: S.of(context).homeScreenRealLabelTextField,
                  onChanged: getCurrency,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenDollarsPrefixTextField,
                  labelText: S.of(context).homeScreenDollarsLabelTextField,
                  onChanged: getCurrency,
                  value: dollar,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenEurosPrefixTextField,
                  labelText: S.of(context).homeScreenEurosLabelTextField,
                  onChanged: getCurrency,
                  value: eur,
                ),
              ],
            ),
          ),
        ),
      );
}
