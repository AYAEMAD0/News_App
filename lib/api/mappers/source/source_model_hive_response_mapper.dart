import 'package:news_app/api/mappers/source/sources_model_hive_mapper.dart';
import 'package:news_app/data/model_hive/source/source_response_model.dart';
import '../../../domain/entities/source/source_response.dart';

extension SourceModelHiveResponseMapper on SourceResponseModel{
  SourceResponse toSourceResponse(){
    return SourceResponse(
      sources:sources?.map((e) => e.toSources(),).toList()??[],
      status: status,
    );
  }
}