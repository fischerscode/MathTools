import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:math_tools/src/common/number_text_formater.dart';

class DivisionPage extends StatefulWidget {
  const DivisionPage({Key? key}) : super(key: key);

  static const String routeName = "/division";

  @override
  State<DivisionPage> createState() => _DivisionPageState();

  static String pageName(AppLocalizations localizations) {
    return localizations.division;
  }
}

class _DivisionPageState extends State<DivisionPage> {
  final _formKey = GlobalKey<FormState>();

  int? dividend;
  int? divisor;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.division),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      child: _NaturalNumberTextField(
                        label: localizations.dividend,
                        onChanged: (value) {
                          setState(() {
                            dividend = int.tryParse(value);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: _NaturalNumberTextField(
                        label: localizations.divisor,
                        onChanged: (value) {
                          setState(() {
                            divisor = int.tryParse(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (dividend != null && divisor != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$dividend / $divisor = ${dividend! ~/ divisor!} R ${dividend! % divisor!}",
                    textScaleFactor: 1.5,
                  ),
                ),
              if (dividend != null && divisor != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "= ${dividend! / divisor!}",
                    textScaleFactor: 1.5,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NaturalNumberTextField extends StatelessWidget {
  const _NaturalNumberTextField({
    Key? key,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.label,
    this.hint,
    this.onChanged,
  }) : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final String? label;
  final String? hint;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return TextFormField(
      initialValue: initialValue,
      inputFormatters: [NumberTextFormatter()],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label != null ? Text(label!) : null,
        hintText: hint,
      ),
      keyboardType: const TextInputType.numberWithOptions(),
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return localizations.required;
        } else if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
