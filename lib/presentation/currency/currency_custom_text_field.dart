import 'package:flutter/material.dart';

typedef OnChanged = void Function(double value);

class CurrencyCustomTextField extends StatefulWidget {
  const CurrencyCustomTextField({
    required this.labelText,
    required this.prefix,
    required this.onChanged,
    required this.textEditingController,
    this.value,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final String prefix;
  final OnChanged onChanged;
  final double? value;
  final TextEditingController? textEditingController;

  @override
  State<CurrencyCustomTextField> createState() =>
      _CurrencyCustomTextFieldState();
}

class _CurrencyCustomTextFieldState extends State<CurrencyCustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: (value) {},
        controller: widget.textEditingController,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.white),
          prefix: Text(
            widget.prefix,
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
