import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model_input.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
@CopyWith()
class ModelInput {
  @HiveField(0)
  int? timestamp;
  @HiveField(1)
  @JsonKey(name: 'accelerometer_x')
  final double accelerometerX;
  @HiveField(2)
  @JsonKey(name: 'linear_accelerometer_x')
  final double linearAccelerometerX;
  @HiveField(3)
  @JsonKey(name: 'gravity_x')
  final double gravityX;
  @HiveField(4)
  @JsonKey(name: 'euler_x')
  final double eulerX;
  @HiveField(5)
  @JsonKey(name: 'euler_z')
  final double eulerZ;
  @HiveField(6)
  @JsonKey(name: 'quaternion_x')
  final double quaternionX;
  @HiveField(7)
  @JsonKey(name: 'quaternion_z')
  final double quaternionZ;
  @HiveField(8)
  @JsonKey(name: 'inverse_quaternion_x')
  final double inverseQuaternionX;
  @HiveField(9)
  @JsonKey(name: 'inverse_quaternion_z')
  final double inverseQuaternionZ;
  @HiveField(10)
  @JsonKey(name: 'relative_orientation_z')
  final double relativeOrientationZ;
  @HiveField(11)
  @JsonKey(name: 'magnetometer_x')
  final double magnetometerX;

  ModelInput({
    this.timestamp,
    required this.accelerometerX,
    required this.linearAccelerometerX,
    required this.magnetometerX,
    required this.gravityX,
    required this.eulerX,
    required this.eulerZ,
    required this.quaternionX,
    required this.quaternionZ,
    required this.inverseQuaternionX,
    required this.inverseQuaternionZ,
    required this.relativeOrientationZ,
  });
  @override
  factory ModelInput.fromJson(Map<String, dynamic> json) =>
      _$ModelInputFromJson(json);
  Map<String, dynamic> toJson() => _$ModelInputToJson(this);
  @override
  String toString() {
    return toJson().toString();
  }

  List<double> get toList {
    return [
      accelerometerX,
      linearAccelerometerX,
      gravityX,
      eulerX,
      eulerZ,
      quaternionX,
      quaternionZ,
      inverseQuaternionX,
      inverseQuaternionZ,
      relativeOrientationZ,
      magnetometerX
    ];
  }
}
