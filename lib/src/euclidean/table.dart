import 'package:flutter/material.dart';
import 'package:math_tools/src/euclidean/step.dart';

class EuclideanTable extends StatelessWidget {
  const EuclideanTable(this.steps, {Key? key}) : super(key: key);

  final List<EuclideanStep> steps;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text("q")),
          DataColumn(label: Text("aₙ")),
          DataColumn(label: Text("xₙ")),
          DataColumn(label: Text("yₙ")),
        ],
        rows: steps
            .map(
              (step) => DataRow(
                cells: [
                  DataCell(Center(child: Text("${step.q ?? "-"}"))),
                  DataCell(Center(child: Text("${step.a}"))),
                  DataCell(Center(child: Text("${step.x}"))),
                  DataCell(Center(child: Text("${step.y}"))),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
