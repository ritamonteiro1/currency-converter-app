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
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          prefix: Text(
            prefix,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      );
}
