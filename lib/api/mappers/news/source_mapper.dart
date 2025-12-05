import '../../../domain/entities/news/source.dart';
import '../../model/news/source_dto.dart';

extension SourceMapper on SourceDto{
  Source toSourceResponse(){
    return Source(
      name: name,
      id: id,
    );
  }
}