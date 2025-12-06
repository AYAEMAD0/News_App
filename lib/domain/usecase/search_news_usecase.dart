import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import 'package:news_app/domain/repo/search/search_news_repo.dart';

@injectable
class SearchNewsUseCase {
  SearchNewsRepo searchNewsRepo;

  SearchNewsUseCase({required this.searchNewsRepo});

  Future<NewsResponse> call({
    required String query,
    String searchIn = "title,description,content",
  }) {
    return searchNewsRepo.searchNews(query: query, searchIn: searchIn,);
  }
}
