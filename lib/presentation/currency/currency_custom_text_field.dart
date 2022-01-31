import 'package:flutter/material.dart';

typedef OnChanged = void Function(double value);

class CurrencyCustomTextField extends StatefulWidget {
  const CurrencyCustomTextField({
    required this.labelText,
    required this.prefix,
    required this.onChanged,
    this.value,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final String prefix;
  final OnChanged onChanged;
  final double? value;

  @override
  State<CurrencyCustomTextField> createState() =>
      _CurrencyCustomTextFieldState();
}

class _CurrencyCustomTextFieldState extends State<CurrencyCustomTextField> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _textEditingController.text = widget.value.toString();
    }
    _textEditingController.addListener(() {
      if (_textEditingController.text.isNotEmpty) {
        widget.onChanged(double.parse(_textEditingController.text));
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: (value) {},
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
