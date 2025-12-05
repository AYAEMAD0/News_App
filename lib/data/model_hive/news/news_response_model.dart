import 'package:hive/hive.dart';
import 'articles_model.dart';

part 'news_response_model.g.dart';
@HiveType(typeId: 1)
class NewsResponseModel extends HiveObject{
  @HiveField(0)
  String? status;
  @HiveField(1)
  int? totalResults;
  @HiveField( 2)
  List<ArticlesModel>? articles;

  NewsResponseModel({
      this.status, 
      this.totalResults, 
      this.articles,});
}
