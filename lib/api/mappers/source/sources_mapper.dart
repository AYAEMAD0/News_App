import '../../../domain/entities/source/sources.dart';
import '../../model/source/sources_dto.dart';

extension SourcesMapper on SourcesDto{
  Sources toSourceResponse(){
    return Sources(
     category: category,
      name: name,
      id: id,
      description: description,
      country: country,
      language: language,
      url: url,
    );
  }
}