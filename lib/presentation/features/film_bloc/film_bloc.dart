

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_with_flutter/core/usecase.dart';
import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';
import 'package:testing_with_flutter/domain/usecase/get_film_detail_usecase.dart';
import 'package:testing_with_flutter/domain/usecase/get_films_usecase.dart';

import '../../../data/models/film_model/film_response_model.dart';

part 'film_event.dart';
part 'film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  GetFilmsUseCase getFilmsUseCase;
  FilmResponseModel? filmResponseModel;
  FilmBloc(this.getFilmsUseCase) : super(FilmInitial()) {
    on<FilmEvent>((event, emit) async {
      if (event is GetFilmsEvent) {
        emit(FilmLoading());
        final result = await getFilmsUseCase.call(NoParams());
        emit(
          result.fold(
            (l) => FilmError(l.failureMessage),
            (r) {
              filmResponseModel = r;
              return FilmLoaded(result: filmResponseModel!);
            },
          ),
        );
      }
    });
  }
}
