import 'package:news_app/domain/entities/news/news_response.dart';

abstract class SearchNewsRepo {
  Future<NewsResponse> searchNews({
    required String query,
    String searchIn = "title,description,content",
  });
}
