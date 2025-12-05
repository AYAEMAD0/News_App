// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceResponseModelAdapter extends TypeAdapter<SourceResponseModel> {
  @override
  final int typeId = 3;

  @override
  SourceResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourceResponseModel(
      status: fields[0] as String?,
      sources: (fields[1] as List?)?.cast<SourcesModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SourceResponseModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.sources);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
