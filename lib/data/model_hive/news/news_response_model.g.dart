// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsResponseModelAdapter extends TypeAdapter<NewsResponseModel> {
  @override
  final int typeId = 1;

  @override
  NewsResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsResponseModel(
      status: fields[0] as String?,
      totalResults: fields[1] as int?,
      articles: (fields[2] as List?)?.cast<ArticlesModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
