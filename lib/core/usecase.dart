import 'package:equatable/equatable.dart';

abstract class Usecases<TResult, TParams> {
  Future<TResult> call(TParams params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
