import 'package:news_app/api/mappers/news/source_mapper.dart';
import 'package:news_app/api/model/news/articles_dto.dart';
import 'package:news_app/domain/entities/news/articles.dart';

extension ArticlesMapper on ArticlesDto {
  Articles toArticles() {
    return Articles(
      url: url,
      description: description,
      title: title,
      author: author,
      content: content,
      publishedAt: publishedAt,
      source: source?.toSourceResponse(),
      urlToImage: urlToImage,
    );
  }
}
