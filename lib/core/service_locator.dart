import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:testing_with_flutter/core/network_utils.dart';
import 'package:testing_with_flutter/data/data_sources/film_remote_data_sources.dart';
import 'package:testing_with_flutter/data/repository_impl/film_repository_impl.dart';
import 'package:testing_with_flutter/domain/repository/film_repository.dart';
import 'package:testing_with_flutter/domain/usecase/get_films_usecase.dart';

import '../domain/usecase/get_film_detail_usecase.dart';

final di = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    await initExternal();
    await initRepo();
    await initDataSources();
    await initUsecase();
  }

  static initExternal() {
    di.registerLazySingleton(() => Dio());
    di.registerLazySingleton(() => NetworkUtils(dio: di()));
  }

  static initRepo() {
    di.registerLazySingleton<FilmRepository>(() => FilmRepositoryImpl(di()));
  }

  static initDataSources() {
    di.registerLazySingleton<FilmRemoteDataSource>(
        () => FilmRemoteDataSourceImpl(di()));
  }

  static initUsecase() {
    di.registerLazySingleton<GetFilmsUseCase>(() => GetFilmsUseCaseImpl(di()));
    di.registerLazySingleton<GetFilmDetailsUseCase>(
        () => GetFilmDetailsUseCaseImpl(di()));
  }
}
