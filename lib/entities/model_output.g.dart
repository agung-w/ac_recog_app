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
      result: fields[1] as String,
      probability: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ModelOutput obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.result)
      ..writeByte(2)
      ..write(obj.probability);
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
      result: json['result'] as String,
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$ModelOutputToJson(ModelOutput instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'result': instance.result,
      'probability': instance.probability,
    };
