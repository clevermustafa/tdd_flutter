import 'package:dartz/dartz.dart';
import 'package:testing_with_flutter/core/failure.dart';
import 'package:testing_with_flutter/core/usecase.dart';
import 'package:testing_with_flutter/data/models/film_model/film_response_model.dart';
import 'package:testing_with_flutter/domain/repository/film_repository.dart';

abstract class GetFilmsUseCase
    implements Usecases<Either<Failure, FilmResponseModel>, NoParams> {}

class GetFilmsUseCaseImpl implements GetFilmsUseCase {
  FilmRepository filmRepository;
  GetFilmsUseCaseImpl(this.filmRepository);

  @override
  Future<Either<Failure, FilmResponseModel>> call(NoParams params) async {
    return await filmRepository.getFilms();
  }
}
