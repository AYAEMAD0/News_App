import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/local/news/news_local_data_source.dart';
import 'package:news_app/data/data_source/remote/news/news_remote_data_source.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import 'package:news_app/domain/repo/news/news_repo.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsLocalDataSource newsLocalDataSource;
  NewsRepoImpl({required this.newsRemoteDataSource,required this.newsLocalDataSource});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId, {int page = 1, int pageSize = 10}) {
    // TODO: implement getNewsBySourceId
    return newsRemoteDataSource.getNewsBySourceId(sourceId);
  }

}