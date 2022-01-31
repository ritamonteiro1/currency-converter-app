import 'package:currencyconverter_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import 'currency_custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).homeScreenCurrencyConverterText),
        ),
        body: Column(
          children: [
            const Image(
              image: AssetImage(
                ConstantImages.currencyConverter,
              ),
            ),
            CurrencyCustomTextField(
              prefix: S.of(context).homeScreenRealPrefixTextField,
              labelText: S.of(context).homeScreenRealLabelTextField,
            ),
            CurrencyCustomTextField(
              prefix: S.of(context).homeScreenDollarsPrefixTextField,
              labelText: S.of(context).homeScreenDollarsLabelTextField,
            ),
            CurrencyCustomTextField(
              prefix: S.of(context).homeScreenEurosPrefixTextField,
              labelText: S.of(context).homeScreenEurosLabelTextField,
            ),
          ],
        ),
      );
}
