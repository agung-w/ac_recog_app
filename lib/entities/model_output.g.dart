// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_output.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelOutputAdapter extends TypeAdapter<ModelOutput> {
  @override
  final int typeId = 1;

  @override
  ModelOutput read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelOutput(
      timestamp: fields[0] as int,
      username: fields[1] as String,
      probability: fields[2] as double,
      result: fields[3] as String,
      hand: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelOutput obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.probability)
      ..writeByte(3)
      ..write(obj.result)
      ..writeByte(4)
      ..write(obj.hand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelOutputAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelOutput _$ModelOutputFromJson(Map<String, dynamic> json) => ModelOutput(
      timestamp: json['timestamp'] as int,
      username: json['username'] as String,
      probability: (json['probability'] as num).toDouble(),
      result: json['result'] as String,
      hand: json['hand'] as String,
    );

Map<String, dynamic> _$ModelOutputToJson(ModelOutput instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'username': instance.username,
      'probability': instance.probability,
      'result': instance.result,
      'hand': instance.hand,
    };
