import 'articles.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsResponse({
      this.status, 
      this.totalResults, 
      this.articles,});
}
