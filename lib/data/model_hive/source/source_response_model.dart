import 'package:hive/hive.dart';
import 'package:news_app/data/model_hive/source/sources_model.dart';
part 'source_response_model.g.dart';
@HiveType(typeId: 3)
class SourceResponseModel extends HiveObject {
  SourceResponseModel({
      this.status, 
      this.sources,});
  @HiveField(0)
  String? status;
  @HiveField(1)
  List<SourcesModel>? sources;

}