import 'package:testing_with_flutter/data/data_sources/film_remote_data_sources.dart';
import 'package:testing_with_flutter/data/models/film_model/film_response_model.dart';
import 'package:testing_with_flutter/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';
import 'package:testing_with_flutter/domain/repository/film_repository.dart';

class FilmRepositoryImpl implements FilmRepository {
  FilmRemoteDataSource filmRemoteDataSource;
  FilmRepositoryImpl(this.filmRemoteDataSource);
  @override
  Future<Either<Failure, FilmResponseModel>> getFilms() async {
    try {
      final result = await filmRemoteDataSource.getFilms();
      return Right(result);
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<Either<Failure, FilmEntity>> getFilmDetails(int id) async{
   try {
    final result = await filmRemoteDataSource.getFilmDetails(id);
    return Right(result);
   }catch(e) {
    return Left(ServerFailure());
   }
  }
}


