import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/api/mappers/source/source_model_hive_response_mapper.dart';
import 'package:news_app/data/data_source/local/source/source_local_data_source.dart';
import 'package:news_app/data/model_hive/source/source_response_model.dart';
import 'package:news_app/domain/entities/source/source_response.dart';

@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSource(String categoryId) async{
    // TODO: implement getNewsBySourceId
    var box =await Hive.openBox("Sources");
    SourceResponseModel data =await box.get(categoryId);
    //todo SourceResponseModel-->SourceResponse
    return data.toSourceResponse();
  }

  @override
  void saveSource(SourceResponseModel data, String categoryId) async {
    var box =await Hive.openBox("Sources");
    //todo NewsResponseModel (hive)
    await box.put(categoryId, data);
    await box.close();
  }
}
