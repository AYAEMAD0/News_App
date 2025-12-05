import 'package:news_app/api/mappers/source/sources_hive_mapper.dart';
import 'package:news_app/data/model_hive/source/source_response_model.dart';
import '../../../domain/entities/source/source_response.dart';

extension SourceHiveResponseMapper on SourceResponse{
  SourceResponseModel toSourceResponseModel(){
    return SourceResponseModel(
      sources:sources?.map((e) => e.toSourcesModel(),).toList()??[],
      status: status,
    );
  }
}