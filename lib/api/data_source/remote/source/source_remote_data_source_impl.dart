import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/api/mappers/source/source_response_mapper.dart';
import 'package:news_app/domain/entities/source/source_response.dart';
import '../../../../data/data_source/remote/source/source_remote_data_source.dart';

@Injectable(as:SourceRemoteDataSource )
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiServices apiServices;
  SourceRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<SourceResponse> getSource(String categoryId) async{
    // TODO:SourceResponseDto==>SourceResponse
    var responseDto =await apiServices.getSource(categoryId);
    return responseDto.toSourceResponse();
  }


}