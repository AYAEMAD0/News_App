import 'package:news_app/data/model_hive/news/source_model.dart';
import '../../../domain/entities/news/source.dart';

extension SourceModelHiveMapper on SourceModel{
  Source toSource(){
    return Source(
      name: name,
      id: id,
    );
  }
}