import 'package:hive/hive.dart';
import 'package:news_app/data/model_hive/news/source_model.dart';

part 'articles_model.g.dart';
@HiveType(typeId: 0)
class ArticlesModel extends HiveObject {
  @HiveField(0)
  SourceModel? source;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? urlToImage;
  @HiveField(6)
  String? publishedAt;
  @HiveField(7)
  String? content;

  ArticlesModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});
}