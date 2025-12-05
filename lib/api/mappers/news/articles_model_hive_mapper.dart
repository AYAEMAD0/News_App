import 'package:news_app/api/mappers/news/source_model_hive_mapper.dart';
import 'package:news_app/data/model_hive/news/articles_model.dart';
import 'package:news_app/domain/entities/news/articles.dart';

extension ArticlesModelHiveMapper on ArticlesModel {
  Articles toArticle () {
    return Articles (
      url: url,
      description: description,
      title: title,
      author: author,
      content: content,
      publishedAt: publishedAt,
      source: source?.toSource(),
      urlToImage: urlToImage,
    );
  }
}
