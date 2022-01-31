import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../generated/l10n.dart';
import 'currency_custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenDollarsPrefixTextField,
                  labelText: S.of(context).homeScreenDollarsLabelTextField,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenEurosPrefixTextField,
                  labelText: S.of(context).homeScreenEurosLabelTextField,
                ),
              ],
            ),
          ),
        ),
      );
}
