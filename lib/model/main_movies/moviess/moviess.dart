import 'package:json_annotation/json_annotation.dart';

part 'moviess.g.dart';

@JsonSerializable()
class Moviess {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  int? id;
  String? title;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'media_type')
  String? mediaType;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  double? popularity;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  Moviess({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Moviess.fromJson(Map<String, dynamic> json) {
    return _$MoviessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoviessToJson(this);
}
