import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/index.dart';
import '../../utils/index.dart';
import '../repositories/movie_detail_repository.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit({
    required this.repository,
  }) : super(
          MovieDetailState(
            movieLoadData: ViewData.initial(),
          ),
        );

  final MovieDetailRepository repository;

  void getMovieDetail(int id) async {
    try {
      emit(state.copyWith(movieLoadData: ViewData.loading()));

      final response = await repository.getMovieDetail(id: id);
      emit(
        state.copyWith(
          movieLoadData: ViewData.loaded(data: response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          movieLoadData: ViewData.error(message: '$e'),
        ),
      );
    }
  }
}
