part of 'filmdetails_bloc.dart';

abstract class FilmdetailsState extends Equatable {
  const FilmdetailsState();
  
  @override
  List<Object> get props => [];
}

class FilmdetailsInitial extends FilmdetailsState {}
class FilmDetailsLoading extends FilmdetailsState {}
class FilmDetailsError extends FilmdetailsState {
  final String errorMessage;
  const FilmDetailsError(this.errorMessage);
}
class FilmDetailsLoaded extends FilmdetailsState {
  final FilmEntity filmDetails;
  const FilmDetailsLoaded(this.filmDetails);
}
