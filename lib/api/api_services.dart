import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/api/api_endpoint.dart';
import 'package:news_app/api/model/source/source_response_dto.dart';

import '../core/exceptions/app_exception.dart';
import 'model/news/news_response_dto.dart';

class ApiServices {
  final Dio dio;

  ApiServices(this.dio);

  Future<SourceResponseDto> getSource(String categoryId) async {
    try {
      final response = await dio.get(
          ApiEndpoint.sourceApi,
          queryParameters: {
            "apiKey": dotenv.env['API_KEY'],
            "category": categoryId,});
      return SourceResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error!;
      }
      rethrow;
    }
  }


  Future<NewsResponseDto> getNewsBySourceId(String sourceId, {
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await dio.get(
          ApiEndpoint.newApi,
          queryParameters: {
            "sources": sourceId,
            "apiKey": dotenv.env['API_KEY'],
            "page": page.toString(),
            "pageSize": pageSize.toString(),
          });
      return NewsResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error!;
      }
      rethrow;
    }
  }


  Future<NewsResponseDto> searchNews({
    required String query,
    String searchIn = "title,description,content",
  }) async {
    try {
      final response = await dio.get(
          ApiEndpoint.newApi,
          queryParameters: {
            "q": query,
            "searchIn": searchIn,
            "apiKey": dotenv.env['API_KEY'],
          });
      return NewsResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error!;
      }
      rethrow;
    }
  }


}
