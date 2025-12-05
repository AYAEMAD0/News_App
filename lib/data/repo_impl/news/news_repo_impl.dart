import 'package:injectable/injectable.dart';
import 'package:news_app/api/mappers/news/news_response_hive_mapper.dart';
import 'package:news_app/data/data_source/local/news/news_local_data_source.dart';
import 'package:news_app/data/data_source/remote/news/news_remote_data_source.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import 'package:news_app/domain/repo/news/news_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsLocalDataSource newsLocalDataSource;
  NewsRepoImpl({
    required this.newsRemoteDataSource,
    required this.newsLocalDataSource,
  });

  @override
  Future<NewsResponse> getNewsBySourceId(
    String sourceId, {
    int page = 1,
    int pageSize = 10,
  }) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.vpn) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      final data= await newsRemoteDataSource.getNewsBySourceId(sourceId, pageSize: pageSize, page: page,);
      //todo convert NewsResponse--->NewsResponseModel(hive adapter)
      newsLocalDataSource.saveNews(data.toNewsResponseModel(),sourceId);
      //todo convert NewsResponseModel(hive adapter)-->NewsResponse
      return data;
    }else{
      return newsLocalDataSource.getNewsBySourceId(
        sourceId,
        pageSize: pageSize,
        page: page,
      );
    }


  }
}
