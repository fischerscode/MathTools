import 'package:flutter/services.dart';

class NaturalNumberTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty &&
        (int.tryParse(newValue.text)?.isNegative ?? true)) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}
