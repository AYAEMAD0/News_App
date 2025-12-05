import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/source/source_response.dart';
import 'package:news_app/domain/repo/source/source_repo.dart';

@injectable
class SourceUseCase{
  SourceRepo sourceRepo;
  SourceUseCase({required this.sourceRepo});
  Future<SourceResponse>call(String category){
    return sourceRepo.getSource(category);
  }
}