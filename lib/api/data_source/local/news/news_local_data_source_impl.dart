import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import '../../../../data/data_source/local/news/news_local_data_source.dart';

@Injectable(as:NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource{
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10}) {
    // TODO: implement getNewsBySourceId
    throw UnimplementedError();
  }


}