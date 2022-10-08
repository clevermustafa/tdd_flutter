part of 'filmdetails_bloc.dart';

abstract class FilmdetailsEvent extends Equatable {
  const FilmdetailsEvent();

  @override
  List<Object> get props => [];
}

class GetFilmDetailsEvent extends FilmdetailsEvent {
  final int id;
  const GetFilmDetailsEvent(this.id);
}


