import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/api/mappers/source/source_hive_response_mapper.dart';
import 'package:news_app/data/data_source/local/source/source_local_data_source.dart';
import 'package:news_app/data/data_source/remote/source/source_remote_data_source.dart';
import 'package:news_app/domain/entities/source/source_response.dart';
import 'package:news_app/domain/repo/source/source_repo.dart';

@Injectable(as: SourceRepo)
class SourceRepoImpl implements SourceRepo {
  SourceLocalDataSource sourceLocalDataSource;
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceRepoImpl({
    required this.sourceRemoteDataSource,
    required this.sourceLocalDataSource,
  });

  @override
  Future<SourceResponse> getSource(String categoryId) async {
    // TODO: implement getSource
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.vpn) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      var data = await sourceRemoteDataSource.getSource(categoryId);
      //todo convert SourceResponse--->SourceResponseModel(hive adapter)
      sourceLocalDataSource.saveSource(data.toSourceResponseModel(),categoryId);
      //todo convert SourceResponseModel(hive adapter)-->SourceResponse
      return data;
    } else {
      return sourceLocalDataSource.getSource(categoryId);
    }
  }
}
