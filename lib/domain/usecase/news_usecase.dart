import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/news/news_response.dart';
import 'package:news_app/domain/repo/news/news_repo.dart';

@injectable
class NewsUseCase {
  NewsRepo newsRepo;
  NewsUseCase({required this.newsRepo});
  Future<NewsResponse> call(
    String sourceId, {
    int page = 1,
    int pageSize = 10,
  }) {
    return newsRepo.getNewsBySourceId(sourceId,page: page,pageSize: pageSize);
  }
}
