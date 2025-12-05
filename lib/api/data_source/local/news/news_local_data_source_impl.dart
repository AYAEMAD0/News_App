import 'package:injectable/injectable.dart';
import 'package:news_app/api/mappers/news/news_response_model_hive_mapper.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import '../../../../data/data_source/local/news/news_local_data_source.dart';
import 'package:hive/hive.dart';
import '../../../../data/model_hive/news/news_response_model.dart';

@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<NewsResponse> getNewsBySourceId(
    String sourceId, {
    int page = 1,
    int pageSize = 10,
  }) async {
    // TODO: implement getNewsBySourceId
    var box = await Hive.openBox("News");
    NewsResponseModel data = await box.get(sourceId);
    //todo NewsResponseModel-->NewsResponse
    return data.toNewsResponse();
  }

  @override
  void saveNews(NewsResponseModel data, String sourceId) async {
    var box = await Hive.openBox("News");
    //todo NewsResponseModel(hive)
    await box.put(sourceId, data);
    await box.close();
  }
}
