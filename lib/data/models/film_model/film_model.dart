import 'package:testing_with_flutter/domain/entity/film/film_entity.dart';

class FilmModel extends FilmEntity {
  FilmModel(
      {String? title,
      int? episodeId,
      String? openingCrawl,
      String? director,
      String? producer,
      String? releaseDate,
      List<dynamic>? characters,
      List<dynamic>? planets,
      List<dynamic>? starships,
      List<dynamic>? vehicles,
      List<dynamic>? species,
      DateTime? created,
      DateTime? edited,
      String? url})
      : super(
          title: title,
          episodeId: episodeId,
          openingCrawl: openingCrawl,
          director: director,
          producer: producer,
          releaseDate: releaseDate,
          characters: characters,
          planets: planets,
          starships: starships,
          vehicles: vehicles,
          species: species,
          created: created,
          edited: edited,
          url: url,
        );

  @override
  String toString() {
    return 'Result(title: $title, episodeId: $episodeId, openingCrawl: $openingCrawl, director: $director, producer: $producer, releaseDate: $releaseDate, characters: $characters, planets: $planets, starships: $starships, vehicles: $vehicles, species: $species, created: $created, edited: $edited, url: $url)';
  }

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        title: json['title'] as String?,
        episodeId: json['episode_id'] as int?,
        openingCrawl: json['opening_crawl'] as String?,
        director: json['director'] as String?,
        producer: json['producer'] as String?,
        releaseDate: json['release_date'] as String?,
        characters: json['characters'] as List<dynamic>?,
        planets: json['planets'] as List<dynamic>?,
        starships: json['starships'] as List<dynamic>?,
        vehicles: json['vehicles'] as List<dynamic>?,
        species: json['species'] as List<dynamic>?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        edited: json['edited'] == null
            ? null
            : DateTime.parse(json['edited'] as String),
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'episode_id': episodeId,
        'opening_crawl': openingCrawl,
        'director': director,
        'producer': producer,
        'release_date': releaseDate,
        'characters': characters,
        'planets': planets,
        'starships': starships,
        'vehicles': vehicles,
        'species': species,
        'created': created?.toIso8601String(),
        'edited': edited?.toIso8601String(),
        'url': url,
      };
}
