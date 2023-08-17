import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:timeago/timeago.dart' as timeago;
part 'model_output.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class ModelOutput {
  @HiveField(0)
  final int timestamp;
  @HiveField(1)
  @JsonKey(name: 'result')
  final String result;
  @HiveField(2)
  @JsonKey(name: 'probability')
  final double probability;
  const ModelOutput({
    required this.timestamp,
    required this.result,
    required this.probability,
  });
  String get toHumanDate {
    return timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp),
        locale: 'en_short');
  }
}
