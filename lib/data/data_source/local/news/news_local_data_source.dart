import '../../../../domain/entities/news/news_response.dart';
import '../../../model_hive/news/news_response_model.dart';

abstract class NewsLocalDataSource{
  Future<NewsResponse>getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10});
  void saveNews(NewsResponseModel data, String sourceId);
  }
