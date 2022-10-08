import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_with_flutter/core/usecase.dart';
import 'package:testing_with_flutter/data/models/film_model/film_response_model.dart';
import 'package:testing_with_flutter/domain/repository/film_repository.dart';
import 'package:testing_with_flutter/domain/usecase/get_films_usecase.dart';
import 'package:testing_with_flutter/presentation/features/film_bloc/film_bloc.dart';

class MockFilmBloc extends MockBloc<FilmEvent, FilmState> implements FilmBloc {}

class MockFilmRepository extends Mock implements FilmRepository {}

class MockGetFilmUsecase extends Mock implements GetFilmsUseCase {}



void main() {
  late MockFilmBloc mockFilmBloc;
  late MockGetFilmUsecase mockGetFilmUsecase;

  setUp(() {
    mockFilmBloc = MockFilmBloc();
    mockGetFilmUsecase = MockGetFilmUsecase();
  });
  group('FilmBloc', () {
    FilmResponseModel filmResponseModel = FilmResponseModel();

    blocTest(
      'emits [] when nothing is added',
      build: () => mockFilmBloc,
      expect: () => [],
    );

    blocTest(
      'emits [FilmsLoaded] when GetFilmsEvent is added',
      build: () {
        mockFilmBloc.getFilmsUseCase = mockGetFilmUsecase;
        
        when(mockGetFilmUsecase.call(NoParams()))
            .thenAnswer((_) async => Right(filmResponseModel));
        mockFilmBloc.getFilmsUseCase = mockGetFilmUsecase;
        return mockFilmBloc;
      },
      act: (bloc) => mockFilmBloc.add((GetFilmsEvent())),
      expect: () => [isA<FilmLoaded>()],
    );
  });
}
