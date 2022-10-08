part of 'film_bloc.dart';

abstract class FilmState extends Equatable {
  const FilmState();

  @override
  List<Object> get props => [];
}

class FilmInitial extends FilmState {}

class FilmLoading extends FilmState {}

class FilmLoaded extends FilmState {
  final FilmResponseModel result;
 
  const FilmLoaded({required this.result});
}

class FilmError extends FilmState {
  final String failureMessage;
  const FilmError(this.failureMessage);
}
