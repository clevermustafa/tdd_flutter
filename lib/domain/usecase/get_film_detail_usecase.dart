import 'package:dartz/dartz.dart';
import 'package:testing_with_flutter/core/failure.dart';
import 'package:testing_with_flutter/core/usecase.dart';
import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';
import 'package:testing_with_flutter/domain/repository/film_repository.dart';

abstract class GetFilmDetailsUseCase
    implements Usecases<Either<Failure, FilmEntity>, int> {}

class GetFilmDetailsUseCaseImpl implements GetFilmDetailsUseCase {
  FilmRepository filmRepository;
  GetFilmDetailsUseCaseImpl(this.filmRepository);

  @override
  Future<Either<Failure, FilmEntity>> call(int id) async {
    return await filmRepository.getFilmDetails(id);
  }
}
