import 'film_model.dart';

class FilmResponseModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<FilmModel>? results;

  FilmResponseModel({this.count, this.next, this.previous, this.results});

  // @override
  // String toString() {
  //   return 'FilmModel(count: $count, next: $next, previous: $previous, results: $results)';
  // }

  factory FilmResponseModel.fromJson(Map<String, dynamic> json) => FilmResponseModel(
        count: json['count'] as int?,
        next: json['next'] as dynamic,
        previous: json['previous'] as dynamic,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => FilmModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
