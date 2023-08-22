// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SensorDataAdapter extends TypeAdapter<SensorData> {
  @override
  final int typeId = 1;

  @override
  SensorData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SensorData(
      timestamp: fields[0] as int,
      gyroscopeX: fields[1] as double,
      gyroscopeY: fields[2] as double,
      gyroscopeZ: fields[3] as double,
      accelerometerX: fields[4] as double,
      accelerometerY: fields[5] as double,
      accelerometerZ: fields[6] as double,
      linearAccelerometerX: fields[7] as double,
      linearAccelerometerY: fields[8] as double,
      linearAccelerometerZ: fields[9] as double,
      magnetometerX: fields[10] as double,
      magnetometerY: fields[11] as double,
      magnetometerZ: fields[12] as double,
      gravityX: fields[13] as double,
      gravityY: fields[14] as double,
      gravityZ: fields[15] as double,
      eulerX: fields[16] as double,
      eulerY: fields[17] as double,
      eulerZ: fields[18] as double,
      quaternionX: fields[19] as double,
      quaternionY: fields[20] as double,
      quaternionZ: fields[21] as double,
      quaternionW: fields[22] as double,
      inverseQuaternionX: fields[23] as double,
      inverseQuaternionY: fields[24] as double,
      inverseQuaternionZ: fields[25] as double,
      inverseQuaternionW: fields[26] as double,
      relativeOrientationX: fields[27] as double,
      relativeOrientationY: fields[28] as double,
      relativeOrientationZ: fields[29] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SensorData obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.gyroscopeX)
      ..writeByte(2)
      ..write(obj.gyroscopeY)
      ..writeByte(3)
      ..write(obj.gyroscopeZ)
      ..writeByte(4)
      ..write(obj.accelerometerX)
      ..writeByte(5)
      ..write(obj.accelerometerY)
      ..writeByte(6)
      ..write(obj.accelerometerZ)
      ..writeByte(7)
      ..write(obj.linearAccelerometerX)
      ..writeByte(8)
      ..write(obj.linearAccelerometerY)
      ..writeByte(9)
      ..write(obj.linearAccelerometerZ)
      ..writeByte(10)
      ..write(obj.magnetometerX)
      ..writeByte(11)
      ..write(obj.magnetometerY)
      ..writeByte(12)
      ..write(obj.magnetometerZ)
      ..writeByte(13)
      ..write(obj.gravityX)
      ..writeByte(14)
      ..write(obj.gravityY)
      ..writeByte(15)
      ..write(obj.gravityZ)
      ..writeByte(16)
      ..write(obj.eulerX)
      ..writeByte(17)
      ..write(obj.eulerY)
      ..writeByte(18)
      ..write(obj.eulerZ)
      ..writeByte(19)
      ..write(obj.quaternionX)
      ..writeByte(20)
      ..write(obj.quaternionY)
      ..writeByte(21)
      ..write(obj.quaternionZ)
      ..writeByte(22)
      ..write(obj.quaternionW)
      ..writeByte(23)
      ..write(obj.inverseQuaternionX)
      ..writeByte(24)
      ..write(obj.inverseQuaternionY)
      ..writeByte(25)
      ..write(obj.inverseQuaternionZ)
      ..writeByte(26)
      ..write(obj.inverseQuaternionW)
      ..writeByte(27)
      ..write(obj.relativeOrientationX)
      ..writeByte(28)
      ..write(obj.relativeOrientationY)
      ..writeByte(29)
      ..write(obj.relativeOrientationZ);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SensorDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorData _$SensorDataFromJson(Map<String, dynamic> json) => SensorData(
      timestamp: json['timestamp'] as int,
      gyroscopeX: (json['gyroscope_x'] as num).toDouble(),
      gyroscopeY: (json['gyroscope_y'] as num).toDouble(),
      gyroscopeZ: (json['gyroscope_z'] as num).toDouble(),
      accelerometerX: (json['accelerometer_x'] as num).toDouble(),
      accelerometerY: (json['accelerometer_y'] as num).toDouble(),
      accelerometerZ: (json['accelerometer_z'] as num).toDouble(),
      linearAccelerometerX: (json['linear_accelerometer_x'] as num).toDouble(),
      linearAccelerometerY: (json['linear_accelerometer_y'] as num).toDouble(),
      linearAccelerometerZ: (json['linear_accelerometer_z'] as num).toDouble(),
      magnetometerX: (json['magnetometer_x'] as num).toDouble(),
      magnetometerY: (json['magnetometer_y'] as num).toDouble(),
      magnetometerZ: (json['magnetometer_z'] as num).toDouble(),
      gravityX: (json['gravity_x'] as num).toDouble(),
      gravityY: (json['gravity_y'] as num).toDouble(),
      gravityZ: (json['gravity_z'] as num).toDouble(),
      eulerX: (json['euler_x'] as num).toDouble(),
      eulerY: (json['euler_y'] as num).toDouble(),
      eulerZ: (json['euler_z'] as num).toDouble(),
      quaternionX: (json['quaternion_x'] as num).toDouble(),
      quaternionY: (json['quaternion_y'] as num).toDouble(),
      quaternionZ: (json['quaternion_z'] as num).toDouble(),
      quaternionW: (json['quaternion_w'] as num).toDouble(),
      inverseQuaternionX: (json['inverse_quaternion_x'] as num).toDouble(),
      inverseQuaternionY: (json['inverse_quaternion_y'] as num).toDouble(),
      inverseQuaternionZ: (json['inverse_quaternion_z'] as num).toDouble(),
      inverseQuaternionW: (json['inverse_quaternion_w'] as num).toDouble(),
      relativeOrientationX: (json['relative_orientation_x'] as num).toDouble(),
      relativeOrientationY: (json['relative_orientation_y'] as num).toDouble(),
      relativeOrientationZ: (json['relative_orientation_z'] as num).toDouble(),
    );

Map<String, dynamic> _$SensorDataToJson(SensorData instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'gyroscope_x': instance.gyroscopeX,
      'gyroscope_y': instance.gyroscopeY,
      'gyroscope_z': instance.gyroscopeZ,
      'accelerometer_x': instance.accelerometerX,
      'accelerometer_y': instance.accelerometerY,
      'accelerometer_z': instance.accelerometerZ,
      'linear_accelerometer_x': instance.linearAccelerometerX,
      'linear_accelerometer_y': instance.linearAccelerometerY,
      'linear_accelerometer_z': instance.linearAccelerometerZ,
      'magnetometer_x': instance.magnetometerX,
      'magnetometer_y': instance.magnetometerY,
      'magnetometer_z': instance.magnetometerZ,
      'gravity_x': instance.gravityX,
      'gravity_y': instance.gravityY,
      'gravity_z': instance.gravityZ,
      'euler_x': instance.eulerX,
      'euler_y': instance.eulerY,
      'euler_z': instance.eulerZ,
      'quaternion_x': instance.quaternionX,
      'quaternion_y': instance.quaternionY,
      'quaternion_z': instance.quaternionZ,
      'quaternion_w': instance.quaternionW,
      'inverse_quaternion_x': instance.inverseQuaternionX,
      'inverse_quaternion_y': instance.inverseQuaternionY,
      'inverse_quaternion_z': instance.inverseQuaternionZ,
      'inverse_quaternion_w': instance.inverseQuaternionW,
      'relative_orientation_x': instance.relativeOrientationX,
      'relative_orientation_y': instance.relativeOrientationY,
      'relative_orientation_z': instance.relativeOrientationZ,
    };
