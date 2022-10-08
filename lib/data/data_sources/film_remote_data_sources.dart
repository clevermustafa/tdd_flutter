import 'package:dio/dio.dart';
import 'package:testing_with_flutter/core/app_url.dart';
import 'package:testing_with_flutter/core/network_utils.dart';
import 'package:testing_with_flutter/data/models/film_model/film_model.dart';
import 'package:testing_with_flutter/data/models/film_model/film_response_model.dart';
import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';

abstract class FilmRemoteDataSource {
  Future<FilmResponseModel> getFilms();
  Future<FilmEntity> getFilmDetails(int id);
}

class FilmRemoteDataSourceImpl implements FilmRemoteDataSource {
  final NetworkUtils networkUtils;
  FilmRemoteDataSourceImpl(this.networkUtils);
  @override
  Future<FilmResponseModel> getFilms() async {
    try {
      Response response = await networkUtils.get(AppUrl.films);
      return FilmResponseModel.fromJson(parseResponse(response));
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<FilmEntity> getFilmDetails(int id) async {
     try {
      Response response = await networkUtils.get("${AppUrl.films}$id");
      return FilmModel.fromJson(parseResponse(response));
    } catch (e) {
      rethrow;
    }
  }
}
