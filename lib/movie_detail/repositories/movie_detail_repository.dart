import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../models/index.dart';
import '../../networks/api_base_options.dart';

class MovieDetailRepository {
  final Dio _dio = Dio(dioOptions)..interceptors.add(PrettyDioLogger());

  Future<MovieDetailMdl> getMovieDetail({required int id}) async {
    try {
      final response = await _dio.get('/movie/$id');
      return MovieDetailMdl.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
