import 'package:news_app/data/model_hive/source/sources_model.dart';

import '../../../domain/entities/source/sources.dart';

extension SourcesHiveMapper on Sources{
  SourcesModel toSourcesModel(){
    return SourcesModel(
     category: category,
      name: name,
      id: id,
      description: description,
      country: country,
      language: language,
      url: url,
    );
  }
}