import 'package:news_app/data/model_hive/news/source_model.dart';
import '../../../domain/entities/news/source.dart';

extension SourceHiveMapper on Source{
  SourceModel toSourceModel(){
    return SourceModel(
      name: name,
      id: id,
    );
  }
}