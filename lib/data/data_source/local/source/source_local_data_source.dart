import 'package:news_app/data/model_hive/source/source_response_model.dart';

import '../../../../domain/entities/source/source_response.dart';

abstract class SourceLocalDataSource{
  Future<SourceResponse>getSource(String categoryId);
  void saveSource(SourceResponseModel data,String categoryId);

}