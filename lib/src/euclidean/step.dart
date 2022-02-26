import 'package:freezed_annotation/freezed_annotation.dart';

part 'step.freezed.dart';

@freezed
class EuclideanStep with _$EuclideanStep {
  const factory EuclideanStep({
    int? q,
    required int a,
    required int x,
    required int y,
  }) = _EuclideanStep;
}
