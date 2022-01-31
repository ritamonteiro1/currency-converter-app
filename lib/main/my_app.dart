import 'package:currencyconverter_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../constants/constant_fonts.dart';
import '../generated/l10n.dart';
import '../presentation/currency/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: ConstantFonts.poppinsRegular,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: ConstantColor.primaryColor,
          ),
        ),
        home: const HomeScreen(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      );
}
