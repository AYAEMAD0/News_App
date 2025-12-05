

import '../../../data/model_hive/source/sources_model.dart';
import '../../../domain/entities/source/sources.dart';

extension SourcesModelHiveMapper on SourcesModel{
  Sources toSources(){
    return Sources(
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