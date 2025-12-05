import 'package:news_app/domain/entities/source/sources.dart';

class SourceResponse {
  SourceResponse({
      this.status, 
      this.sources,});

  String? status;
  List<Sources>? sources;

}