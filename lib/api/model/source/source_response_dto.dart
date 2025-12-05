import 'package:news_app/api/model/source/sources_dto.dart';

class SourceResponseDto {
  String? status;
  List<SourcesDto>? sources;

  SourceResponseDto({
      this.status, 
      this.sources,});

  SourceResponseDto.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(SourcesDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
