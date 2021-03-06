import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChanged = void Function(double value);

class CurrencyCustomTextField extends StatefulWidget {
  const CurrencyCustomTextField({
    required this.labelText,
    required this.prefix,
    required this.onChanged,
    required this.textEditingController,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final String prefix;
  final OnChanged onChanged;
  final TextEditingController? textEditingController;
  final Function() onTap;

  @override
  State<CurrencyCustomTextField> createState() =>
      _CurrencyCustomTextFieldState();
}

class _CurrencyCustomTextFieldState extends State<CurrencyCustomTextField> {
  @override
  Widget build(BuildContext context) => TextField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onTap: widget.onTap,
        onChanged: (value) {
          widget.onChanged(double.parse(value));
        },
        controller: widget.textEditingController,
        keyboardType: TextInputType.number,
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
