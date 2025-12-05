import 'package:hive/hive.dart';
part 'sources_model.g.dart';
@HiveType(typeId: 4)
class SourcesModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? language;
  @HiveField(6)
  String? country;

  SourcesModel({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,});

}


