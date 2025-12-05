import 'package:news_app/domain/entities/news/news_response.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse>getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10});
}