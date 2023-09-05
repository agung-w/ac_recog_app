// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motion_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotionSummary _$MotionSummaryFromJson(Map<String, dynamic> json) =>
    MotionSummary(
      name: json['name'] as String,
      motionName: json['motion_name'] as String,
      duration: (json['duration'] as num).toDouble(),
    );

Map<String, dynamic> _$MotionSummaryToJson(MotionSummary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'motion_name': instance.motionName,
      'duration': instance.duration,
    };
