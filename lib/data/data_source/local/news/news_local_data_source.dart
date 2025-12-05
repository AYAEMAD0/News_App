import '../../../../domain/entities/news/news_response.dart';

abstract class NewsLocalDataSource{
  Future<NewsResponse>getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10});
}
