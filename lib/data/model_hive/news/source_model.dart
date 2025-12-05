import 'package:hive/hive.dart';
part 'source_model.g.dart';

@HiveType(typeId: 2)
class SourceModel extends HiveObject{
  SourceModel({
    this.id,
    this.name,});

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;

}