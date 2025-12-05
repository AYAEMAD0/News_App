import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/local/source/source_local_data_source.dart';
import 'package:news_app/domain/entities/source/source_response.dart';

@Injectable(as:SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse> getSource(String categoryId) {
    // TODO: implement getSource
    throw UnimplementedError();
  }


}