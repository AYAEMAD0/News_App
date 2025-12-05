import '../../entities/source/source_response.dart';

abstract class SourceRepo{
  Future<SourceResponse> getSource(String categoryId) ;
}