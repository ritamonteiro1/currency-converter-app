import 'package:flutter/material.dart';

class CurrencyCustomTextField extends StatelessWidget {
  const CurrencyCustomTextField({
    required this.labelText,
    required this.prefix,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final String prefix;

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          labelText: labelText,
          prefix: Text(prefix),
        ),
      );
}
