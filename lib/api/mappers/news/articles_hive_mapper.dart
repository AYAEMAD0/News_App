import 'package:news_app/api/mappers/news/source_hive_mapper.dart';
import 'package:news_app/data/model_hive/news/articles_model.dart';
import 'package:news_app/domain/entities/news/articles.dart';

extension ArticlesHiveMapper on Articles {
  ArticlesModel toArticlesModel () {
    return ArticlesModel (
      url: url,
      description: description,
      title: title,
      author: author,
      content: content,
      publishedAt: publishedAt,
      source: source?.toSourceModel(),
      urlToImage: urlToImage,
    );
  }
}
