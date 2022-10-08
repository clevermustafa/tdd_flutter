import 'package:dartz/dartz.dart';
import 'package:testing_with_flutter/core/failure.dart';
import 'package:testing_with_flutter/data/models/film_model/film_response_model.dart';
import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';

abstract class FilmRepository {
  Future<Either<Failure, FilmResponseModel>> getFilms();
  Future<Either<Failure, FilmEntity>> getFilmDetails(int id);
}