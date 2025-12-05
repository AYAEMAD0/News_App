import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/api/mappers/news/news_response_mapper.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import '../../../../data/data_source/remote/news/news_remote_data_source.dart';

@Injectable(as:NewsRemoteDataSource )
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiServices apiServices;
  NewsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId,{int page = 1, int pageSize = 10}) async{
    // TODO:NewsResponseDto==>NewsResponse
    var responseDto =await apiServices.getNewsBySourceId(sourceId);
    return responseDto.toNewsResponse();
  }

}