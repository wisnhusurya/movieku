part of 'movie_cubit.dart';

class MovieState extends Equatable {
  final ViewData<List<MoviePopularMdl>> popularMoviesLoadData;
  final ViewData<List<MovieTrendingMdl>> trendingMoviesLoadData;

  const MovieState({
    required this.popularMoviesLoadData,
    required this.trendingMoviesLoadData,
  });

  MovieState copyWith({
    ViewData<List<MoviePopularMdl>>? popularMoviesLoadData,
    ViewData<List<MovieTrendingMdl>>? trendingMoviesLoadData,
  }) {
    return MovieState(
      popularMoviesLoadData:
          popularMoviesLoadData ?? this.popularMoviesLoadData,
      trendingMoviesLoadData:
          trendingMoviesLoadData ?? this.trendingMoviesLoadData,
    );
  }

  @override
  List<Object?> get props => [
        popularMoviesLoadData,
        trendingMoviesLoadData,
      ];
}
