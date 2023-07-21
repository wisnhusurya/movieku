import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../models/index.dart';
import '../../networks/api_base_options.dart';

class MovieHomeRepository {
  final Dio _dio = Dio(dioOptions)..interceptors.add(PrettyDioLogger());

  Future<List<MoviePopularMdl>> getPopularMovies({required int page}) async {
    try {
      final response = await _dio.get('/movie/popular?page=$page');

      final data = response.data;
      final movies = data['results']
          .map<MoviePopularMdl>((movies) => MoviePopularMdl.fromJson(movies))
          .toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieTrendingMdl>> getTrendingMovies() async {
    try {
      final response = await _dio.get('/trending/movie/day?');
      final data = response.data;
      final trendingMovies = data['results']
          .map<MovieTrendingMdl>((movies) => MovieTrendingMdl.fromJson(movies))
          .toList();

      return trendingMovies;
    } catch (e) {
      rethrow;
    }
  }
}
