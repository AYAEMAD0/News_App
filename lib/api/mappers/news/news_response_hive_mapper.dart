import 'package:news_app/api/mappers/news/articles_hive_mapper.dart';
import 'package:news_app/data/model_hive/news/news_response_model.dart';
import 'package:news_app/domain/entities/news/news_response.dart';

extension NewsResponseHiveMapper on NewsResponse{
  NewsResponseModel toNewsResponseModel(){
    return NewsResponseModel(
      totalResults: totalResults,
      articles: articles?.map((e) => e.toArticlesModel(),).toList()??[],
      status: status
    );
  }
}