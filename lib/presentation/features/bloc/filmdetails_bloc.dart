import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/film/film_entity.dart';
import '../../../domain/usecase/get_film_detail_usecase.dart';

part 'filmdetails_event.dart';
part 'filmdetails_state.dart';

class FilmdetailsBloc extends Bloc<FilmdetailsEvent, FilmdetailsState> {
  GetFilmDetailsUseCase getFilmDetailUsecase;
  FilmdetailsBloc(this.getFilmDetailUsecase) : super(FilmdetailsInitial()) {
    on<FilmdetailsEvent>((event, emit) async {
      if (event is GetFilmDetailsEvent) {
        emit(FilmDetailsLoading());
        final result = await getFilmDetailUsecase.call(event.id);
        emit(
          result.fold(
            (l) => FilmDetailsError(l.failureMessage),
            (r) => FilmDetailsLoaded(r),
          ),
        );
      }
    });
  }
}
