import 'package:news_app/api/mappers/news/articles_model_hive_mapper.dart';
import 'package:news_app/data/model_hive/news/news_response_model.dart';
import 'package:news_app/domain/entities/news/news_response.dart';

extension NewsResponseModelHiveMapper on NewsResponseModel{
  NewsResponse toNewsResponse(){
    return NewsResponse(
      totalResults: totalResults,
      articles: articles?.map((e) => e.toArticle(),).toList()??[],
      status: status
    );
  }
}