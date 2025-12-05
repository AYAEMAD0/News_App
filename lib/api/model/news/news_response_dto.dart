import 'package:news_app/api/model/news/articles_dto.dart';

class NewsResponseDto {
  NewsResponseDto({
      this.status, 
      this.totalResults, 
      this.articles,});

  NewsResponseDto.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(ArticlesDto.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<ArticlesDto>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
