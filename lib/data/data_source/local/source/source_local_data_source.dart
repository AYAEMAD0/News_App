import '../../../../domain/entities/source/source_response.dart';

abstract class SourceLocalDataSource{
  Future<SourceResponse>getSource(String categoryId);
}