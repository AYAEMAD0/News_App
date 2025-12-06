import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/api/mappers/news/news_response_mapper.dart';
import 'package:news_app/data/data_source/remote/search/search_news_remote_data_source.dart';
import 'package:news_app/domain/entities/news/news_response.dart';

@Injectable(as: SearchNewsRemoteDataSource)
class SearchNewsRemoteDataSourceImpl implements SearchNewsRemoteDataSource {
  ApiServices apiServices;

  SearchNewsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<NewsResponse> searchNews({
    required String query,
    String searchIn = "title,description,content",
  }) async {
    // TODO: implement searchNews
    var responseDto = await apiServices.searchNews(
      query: query,
      searchIn: searchIn,
    );
    return responseDto.toNewsResponse();
  }
}
