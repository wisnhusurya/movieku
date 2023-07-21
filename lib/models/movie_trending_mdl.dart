class MovieTrendingMdl {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final List<int> genreIds;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieTrendingMdl({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieTrendingMdl.fromJson(Map<String, dynamic> json) => MovieTrendingMdl(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
        popularity: json['popularity']?.toDouble(),
        releaseDate: DateTime.parse(json['release_date']),
        video: json['video'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'id': id,
        'title': title,
        'original_title': originalTitle,
        'overview': overview,
        'poster_path': posterPath,
        'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
        'popularity': popularity,
        'release_date':
            '${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}',
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}



