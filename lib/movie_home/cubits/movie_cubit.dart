import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/index.dart';
import '../../utils/index.dart';
import '../repositories/movie_home_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({
    required this.repository,
  }) : super(
          MovieState(
            popularMoviesLoadData: ViewData.initial(),
            trendingMoviesLoadData: ViewData.initial(),
          ),
        );

  final MovieHomeRepository repository;

  void getPopularMovies() async {
    try {
      emit(state.copyWith(popularMoviesLoadData: ViewData.loading()));

      final response = await repository.getPopularMovies(page: 1);
      emit(
        state.copyWith(
          popularMoviesLoadData: ViewData.loaded(data: response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          popularMoviesLoadData: ViewData.error(message: '$e'),
        ),
      );
    }
  }

  void getTrendingMovies() async {
    try {
      emit(state.copyWith(trendingMoviesLoadData: ViewData.loading()));

      final response = await repository.getTrendingMovies();
      emit(
        state.copyWith(
          trendingMoviesLoadData: ViewData.loaded(data: response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          trendingMoviesLoadData: ViewData.error(message: '$e'),
        ),
      );
    }
  }
}
