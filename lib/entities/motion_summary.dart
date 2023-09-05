import 'package:json_annotation/json_annotation.dart';
part 'motion_summary.g.dart';

@JsonSerializable()
class MotionSummary {
  final String name;
  @JsonKey(name: 'motion_name')
  final String motionName;
  final double duration;

  MotionSummary(
      {required this.name, required this.motionName, required this.duration});
  @override
  factory MotionSummary.fromJson(Map<String, dynamic> json) =>
      _$MotionSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$MotionSummaryToJson(this);
}
