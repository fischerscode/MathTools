import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:math_tools/src/common/natural_text_formater.dart';

class CongruenceSystemPage extends StatefulWidget {
  const CongruenceSystemPage({Key? key}) : super(key: key);

  static const String routeName = "/congruence";

  @override
  State<CongruenceSystemPage> createState() => _CongruenceSystemPageState();

  static String pageName(AppLocalizations localizations) {
    return localizations.congruenceSystem;
  }
}

class _CongruenceSystemPageState extends State<CongruenceSystemPage> {
  final _formKey = GlobalKey<FormState>();

  int? aa;
  int? ab;
  int? ba;
  int? bb;
  int? iterations;

  List<int>? _solutions;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.congruenceSystem),
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
                    _InputEquation(
                      onSavedA: (value) => aa = int.tryParse(value ?? ""),
                      onSavedB: (value) => ab = int.tryParse(value ?? ""),
                    ),
                    _InputEquation(
                      onSavedA: (value) => ba = int.tryParse(value ?? ""),
                      onSavedB: (value) => bb = int.tryParse(value ?? ""),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: _NaturalNumberTextField(
                    initialValue: "10000",
                    label: localizations.iterations,
                    onSaved: (value) => iterations = int.tryParse(value ?? ""),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState!.save();
                    final aa = this.aa;
                    final ab = this.ab;
                    final ba = this.ba;
                    final bb = this.bb;
                    final iterations = this.iterations;
                    if (aa != null &&
                        ab != null &&
                        ba != null &&
                        bb != null &&
                        iterations != null) {
                      final solutions = <int>[];
                      for (var x = 0; x <= iterations; x++) {
                        if (x % ab == aa && x % bb == ba) {
                          solutions.add(x);
                        }
                      }
                      setState(() {
                        _solutions = solutions;
                      });
                    }
                  }
                },
                child: Text(localizations.calculate),
              ),
              if (_solutions != null)
                SizedBox(
                  width: 150,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text("x")),
                    ],
                    rows: _solutions!
                        .map(
                          (x) => DataRow(
                            cells: [
                              DataCell(Center(child: Text("$x"))),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputEquation extends StatelessWidget {
  const _InputEquation({
    Key? key,
    this.onSavedA,
    this.onSavedB,
  }) : super(key: key);

  final FormFieldSetter<String>? onSavedA;
  final FormFieldSetter<String>? onSavedB;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("x ≡ "),
        SizedBox(
          width: 60,
          child: _NaturalNumberTextField(
            onSaved: onSavedA,
          ),
        ),
        const Text("mod"),
        SizedBox(
          width: 60,
          child: _NaturalNumberTextField(
            onSaved: onSavedB,
          ),
        ),
      ],
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
  }) : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return TextFormField(
      initialValue: initialValue,
      inputFormatters: [NaturalNumberTextFormatter()],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label != null ? Text(label!) : null,
        hintText: hint,
      ),
      keyboardType: const TextInputType.numberWithOptions(),
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
