class FilmEntity {
  String? title;
  int? episodeId;
  String? openingCrawl;
  String? director;
  String? producer;
  String? releaseDate;
  List<dynamic>? characters;
  List<dynamic>? planets;
  List<dynamic>? starships;
  List<dynamic>? vehicles;
  List<dynamic>? species;
  DateTime? created;
  DateTime? edited;
  String? url;

  FilmEntity({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.created,
    this.edited,
    this.url,
  });
}