import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/local/source/source_local_data_source.dart';
import 'package:news_app/data/data_source/remote/source/source_remote_data_source.dart';
import 'package:news_app/domain/entities/source/source_response.dart';
import 'package:news_app/domain/repo/source/source_repo.dart';

@Injectable(as: SourceRepo)
class SourceRepoImpl implements SourceRepo{
  SourceLocalDataSource sourceLocalDataSource;
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceRepoImpl({required this.sourceRemoteDataSource,required this.sourceLocalDataSource});

  @override
  Future<SourceResponse> getSource(String categoryId) {
    // TODO: implement getSource
    return sourceRemoteDataSource.getSource(categoryId);
  }

}