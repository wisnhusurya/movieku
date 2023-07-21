import 'package:dio/dio.dart';

const badeUrlApi = 'https://api.themoviedb.org/3';
const apikey = '647c76d9e3ca5c77004d7a16344b58b0';

final dioOptions = BaseOptions(
  baseUrl: badeUrlApi,
  connectTimeout: const Duration(milliseconds: 5000),
  receiveTimeout: const Duration(milliseconds: 3000),
  contentType: 'application/json;charset=utf-8',
  queryParameters: {'api_key': apikey},
);
