import 'package:flutter/material.dart';
import 'package:math_tools/src/common/natural_text_formater.dart';
import 'package:math_tools/src/euclidean/step.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:math_tools/src/euclidean/table.dart';

class EuclideanPage extends StatefulWidget {
  const EuclideanPage({Key? key}) : super(key: key);

  static const String routeName = "/euclidean";

  @override
  State<EuclideanPage> createState() => _EuclideanPageState();

  static String pageName(AppLocalizations localizations) {
    return localizations.euclidean;
  }
}

class _EuclideanPageState extends State<EuclideanPage> {
  int? _a;
  int? _b;
  List<EuclideanStep>? _steps;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.euclidean),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 150,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "16170",
                          border: OutlineInputBorder(),
                          label: Text("a"),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        inputFormatters: [NaturalNumberTextFormatter()],
                        validator: (value) {
                          if (int.tryParse(value ?? "") == null) {
                            return localizations.required;
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          _a = int.tryParse(value ?? "");
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 150,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "1326",
                          border: OutlineInputBorder(),
                          label: Text("b"),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        inputFormatters: [NaturalNumberTextFormatter()],
                        validator: (value) {
                          if (int.tryParse(value ?? "") == null) {
                            return localizations.required;
                          } else if (int.tryParse(value ?? "") == 0) {
                            return localizations.zeronotallowed;
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          _b = int.tryParse(value ?? "");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                child: Text(localizations.calculate),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? true) {
                    _formKey.currentState?.save();
                    if (_a != null && _b != null) {
                      setState(() {
                        _steps = calculate(_a!, _b!);
                      });
                    }
                  }
                },
              ),
              if (_steps != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    """d = ${_steps![_steps!.length - 2].a}
x = ${_steps![_steps!.length - 2].x}
y = ${_steps![_steps!.length - 2].y}
d = ggT(a,b)
d = xa + yb""",
                  ),
                ),
              if (_steps != null) EuclideanTable(_steps!),
            ],
          ),
        ),
      ),
    );
  }

  static List<EuclideanStep> calculate(int a, int b) {
    return _calculate(
      EuclideanStep(a: a, x: 1, y: 0),
      EuclideanStep(a: b, x: 0, y: 1),
    );
  }

  static List<EuclideanStep> _calculate(
      EuclideanStep previous, EuclideanStep current) {
    if (current.a == 0) {
      return [previous, current];
    } else {
      int q = previous.a ~/ current.a;
      int r = previous.a % current.a;
      return _calculate(
        current,
        EuclideanStep(
          q: q,
          a: r,
          x: previous.x - q * current.x,
          y: previous.y - q * current.y,
        ),
      )..insert(0, previous);
    }
  }
}
