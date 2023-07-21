part of 'movie_detail_cubit.dart';

class MovieDetailState extends Equatable {
  final ViewData<MovieDetailMdl> movieLoadData;

  const MovieDetailState({
    required this.movieLoadData,
  });

  MovieDetailState copyWith({
    ViewData<MovieDetailMdl>? movieLoadData,
  }) {
    return MovieDetailState(
      movieLoadData: movieLoadData ?? this.movieLoadData,
    );
  }

  @override
  List<Object?> get props => [
        movieLoadData,
      ];
}
