// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_source/local/news/news_local_data_source_impl.dart'
    as _i959;
import '../../api/data_source/local/source/source_local_data_source_impl.dart'
    as _i53;
import '../../api/data_source/remote/news/news_remote_data_source_impl.dart'
    as _i739;
import '../../api/data_source/remote/source/source_remote_data_source_impl.dart'
    as _i694;
import '../../api/dio/dio_module.dart' as _i67;
import '../../data/data_source/local/news/news_local_data_source.dart' as _i106;
import '../../data/data_source/local/source/source_local_data_source.dart'
    as _i111;
import '../../data/data_source/remote/news/news_remote_data_source.dart'
    as _i478;
import '../../data/data_source/remote/source/source_remote_data_source.dart'
    as _i314;
import '../../data/repo_impl/news/news_repo_impl.dart' as _i404;
import '../../data/repo_impl/source/source_repo_impl.dart' as _i548;
import '../../domain/repo/news/news_repo.dart' as _i745;
import '../../domain/repo/source/source_repo.dart' as _i849;
import '../../domain/usecase/news_usecase.dart' as _i487;
import '../../domain/usecase/source_usecase.dart' as _i690;
import '../../features/home/presentation/viewmodel/home/home_cubit.dart'
    as _i743;
import '../../features/news/presentation/viewmodel/news/news_cubit.dart'
    as _i923;
import '../../features/news/presentation/viewmodel/source/source_cubit.dart'
    as _i666;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i743.HomeCubit>(() => _i743.HomeCubit());
    gh.singleton<_i361.BaseOptions>(() => dioModule.provideBaseOption());
    gh.singleton<_i528.PrettyDioLogger>(() => dioModule.providePrettyLogger());
    gh.factory<_i111.SourceLocalDataSource>(
        () => _i53.SourceLocalDataSourceImpl());
    gh.factory<_i106.NewsLocalDataSource>(
        () => _i959.NewsLocalDataSourceImpl());
    gh.singleton<_i361.Dio>(() => dioModule.provideDio(
          gh<_i361.BaseOptions>(),
          gh<_i528.PrettyDioLogger>(),
        ));
    gh.singleton<_i394.ApiServices>(
        () => dioModule.provideApiServices(gh<_i361.Dio>()));
    gh.factory<_i478.NewsRemoteDataSource>(() =>
        _i739.NewsRemoteDataSourceImpl(apiServices: gh<_i394.ApiServices>()));
    gh.factory<_i745.NewsRepo>(() => _i404.NewsRepoImpl(
          newsRemoteDataSource: gh<_i478.NewsRemoteDataSource>(),
          newsLocalDataSource: gh<_i106.NewsLocalDataSource>(),
        ));
    gh.factory<_i487.NewsUseCase>(
        () => _i487.NewsUseCase(newsRepo: gh<_i745.NewsRepo>()));
    gh.factory<_i314.SourceRemoteDataSource>(() =>
        _i694.SourceRemoteDataSourceImpl(apiServices: gh<_i394.ApiServices>()));
    gh.factory<_i923.NewsCubit>(
        () => _i923.NewsCubit(newsUseCase: gh<_i487.NewsUseCase>()));
    gh.factory<_i849.SourceRepo>(() => _i548.SourceRepoImpl(
          sourceRemoteDataSource: gh<_i314.SourceRemoteDataSource>(),
          sourceLocalDataSource: gh<_i111.SourceLocalDataSource>(),
        ));
    gh.factory<_i690.SourceUseCase>(
        () => _i690.SourceUseCase(sourceRepo: gh<_i849.SourceRepo>()));
    gh.factory<_i666.SourceCubit>(
        () => _i666.SourceCubit(sourceUseCase: gh<_i690.SourceUseCase>()));
    return this;
  }
}

class _$DioModule extends _i67.DioModule {}
