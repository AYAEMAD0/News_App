import 'package:news_app/api/mappers/news/articles_mapper.dart';
import 'package:news_app/api/model/news/news_response_dto.dart';
import 'package:news_app/domain/entities/news/news_response.dart';

extension NewsResponseMapper on NewsResponseDto{
  NewsResponse toNewsResponse(){
    return NewsResponse(
     status: status,
      articles: articles?.map((e) => e.toArticles(),).toList()??[],
      totalResults: totalResults,
    );
  }
}