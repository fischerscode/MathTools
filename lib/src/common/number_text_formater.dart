import 'package:flutter/services.dart';

class NumberTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty &&
        newValue.text != "-" &&
        (int.tryParse(newValue.text) == null)) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}
