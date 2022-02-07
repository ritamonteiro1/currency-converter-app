import 'package:flutter/material.dart';

class CurrencyCustomText extends StatelessWidget {
  const CurrencyCustomText({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      );
}
