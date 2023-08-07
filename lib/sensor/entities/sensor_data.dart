import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sensor_data.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class SensorData {
  @HiveField(0)
  final int timestamp;
  @HiveField(1)
  @JsonKey(name: 'gyroscope_x')
  final double gyroscopeX;
  @HiveField(2)
  @JsonKey(name: 'gyroscope_y')
  final double gyroscopeY;
  @HiveField(3)
  @JsonKey(name: 'gyroscope_z')
  final double gyroscopeZ;
  @HiveField(4)
  @JsonKey(name: 'accelerometer_x')
  final double accelerometerX;
  @HiveField(5)
  @JsonKey(name: 'accelerometer_y')
  final double accelerometerY;
  @HiveField(6)
  @JsonKey(name: 'accelerometer_z')
  final double accelerometerZ;
  @HiveField(7)
  @JsonKey(name: 'linear_accelerometer_x')
  final double linearAccelerometerX;
  @HiveField(8)
  @JsonKey(name: 'linear_accelerometer_y')
  final double linearAccelerometerY;
  @HiveField(9)
  @JsonKey(name: 'linear_accelerometer_z')
  final double linearAccelerometerZ;
  @HiveField(10)
  @JsonKey(name: 'magnetometer_x')
  final double magnetometerX;
  @HiveField(11)
  @JsonKey(name: 'magnetometer_y')
  final double magnetometerY;
  @HiveField(12)
  @JsonKey(name: 'magnetometer_z')
  final double magnetometerZ;
  @HiveField(13)
  @JsonKey(name: 'gravity_x')
  final double gravityX;
  @HiveField(14)
  @JsonKey(name: 'gravity_y')
  final double gravityY;
  @HiveField(15)
  @JsonKey(name: 'gravity_z')
  final double gravityZ;
  @HiveField(16)
  @JsonKey(name: 'euler_x')
  final double eulerX;
  @HiveField(17)
  @JsonKey(name: 'euler_y')
  final double eulerY;
  @HiveField(18)
  @JsonKey(name: 'euler_z')
  final double eulerZ;
  @HiveField(19)
  @JsonKey(name: 'quaternion_x')
  final double quaternionX;
  @HiveField(20)
  @JsonKey(name: 'quaternion_y')
  final double quaternionY;
  @HiveField(21)
  @JsonKey(name: 'quaternion_z')
  final double quaternionZ;
  @HiveField(22)
  @JsonKey(name: 'quaternion_w')
  final double quaternionW;
  @HiveField(23)
  @JsonKey(name: 'inverse_quaternion_x')
  final double inverseQuaternionX;
  @HiveField(24)
  @JsonKey(name: 'inverse_quaternion_y')
  final double inverseQuaternionY;
  @HiveField(25)
  @JsonKey(name: 'inverse_quaternion_z')
  final double inverseQuaternionZ;
  @HiveField(26)
  @JsonKey(name: 'inverse_quaternion_w')
  final double inverseQuaternionW;
  @HiveField(27)
  @JsonKey(name: 'relative_orientation_x')
  final double relativeOrientationX;
  @HiveField(28)
  @JsonKey(name: 'relative_orientation_y')
  final double relativeOrientationY;
  @HiveField(29)
  @JsonKey(name: 'relative_orientation_z')
  final double relativeOrientationZ;
  const SensorData({
    required this.timestamp,
    required this.gyroscopeX,
    required this.gyroscopeY,
    required this.gyroscopeZ,
    required this.accelerometerX,
    required this.accelerometerY,
    required this.accelerometerZ,
    required this.linearAccelerometerX,
    required this.linearAccelerometerY,
    required this.linearAccelerometerZ,
    required this.magnetometerX,
    required this.magnetometerY,
    required this.magnetometerZ,
    required this.gravityX,
    required this.gravityY,
    required this.gravityZ,
    required this.eulerX,
    required this.eulerY,
    required this.eulerZ,
    required this.quaternionX,
    required this.quaternionY,
    required this.quaternionZ,
    required this.quaternionW,
    required this.inverseQuaternionX,
    required this.inverseQuaternionY,
    required this.inverseQuaternionZ,
    required this.inverseQuaternionW,
    required this.relativeOrientationX,
    required this.relativeOrientationY,
    required this.relativeOrientationZ,
  });
  @override
  factory SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataFromJson(json);
  Map<String, dynamic> toJson() => _$SensorDataToJson(this);
  @override
  String toString() {
    return toJson().toString();
  }
}
