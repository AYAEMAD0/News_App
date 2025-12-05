import 'package:news_app/api/mappers/source/sources_mapper.dart';
import 'package:news_app/api/model/source/source_response_dto.dart';
import '../../../domain/entities/source/source_response.dart';

extension SourceResponseMapper on SourceResponseDto{
  SourceResponse toSourceResponse(){
    return SourceResponse(
      sources:sources?.map((e) => e.toSourceResponse(),).toList()??[],
      status: status,
    );
  }
}