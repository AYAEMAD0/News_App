import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/remote/search/search_news_remote_data_source.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import 'package:news_app/domain/repo/search/search_news_repo.dart';

@Injectable(as: SearchNewsRepo)
class SearchNewsRepoImpl implements SearchNewsRepo {
  SearchNewsRemoteDataSource searchNewsRemoteDataSource;

  SearchNewsRepoImpl({required this.searchNewsRemoteDataSource});

  @override
  Future<NewsResponse> searchNews({
    required String query,
    String searchIn = "title,description,content",
  }) {
    // TODO: implement searchNews
    return searchNewsRemoteDataSource.searchNews(
      query: query,
      searchIn: searchIn,
    );
  }
}
