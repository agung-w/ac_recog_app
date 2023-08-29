import 'package:ac_recog_app/helper/my_custom_date_message.dart';
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
  final String username;
  @HiveField(2)
  final double probability;
  @HiveField(3)
  final String result;
  @HiveField(4)
  final String hand;

  const ModelOutput({
    required this.timestamp,
    required this.username,
    required this.probability,
    required this.result,
    required this.hand,
  });
  String get toHumanDate {
    timeago.setLocaleMessages('en_short', MyCustomDateMessage());
    return timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp),
        locale: 'en_short', allowFromNow: true);
  }

  @override
  factory ModelOutput.fromJson(Map<String, dynamic> json) =>
      _$ModelOutputFromJson(json);
  Map<String, dynamic> toJson() => _$ModelOutputToJson(this);
  @override
  String toString() {
    return toJson().toString();
  }
}
