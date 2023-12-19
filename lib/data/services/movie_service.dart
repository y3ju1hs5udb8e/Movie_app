import 'package:dio/dio.dart';
import 'package:movie_app/data/constant/api.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/data/model/video_model.dart';

class MovieService {
  static final dio = Dio(
    BaseOptions(
      headers: {
        'Accept': 'application/json',
        'Authorization': ApiLink.apiKey,
      },
    ),
  );

  static Future<List<Movie>> getMovie({required String link}) async {
    try {
      final res = await dio.get(link);
      return (res.data['results'] as List)
          .map((e) => Movie.formJson(e))
          .toList();
    } on DioException catch (e) {
      throw '${e.message}';
    }
  }

  static Future<List<Video>> getVideo({required int id}) async {
    try {
      final res =
          await dio.get('https://api.themoviedb.org/3/movie/$id/videos');
      return (res.data["results"] as List)
          .map((e) => Video.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw '${e.message}';
    }
  }

  static Future<List<Movie>> searchVideo({required String query}) async {
    try {
      final res = await dio.get(
        ApiLink.search,
        queryParameters: {
          'query': query,
        },
      );

      if ((res.data["results"] as List).isNotEmpty) {
        return (res.data["results"] as List)
            .map((e) => Movie.formJson(e))
            .toList();
      } else {
        throw 'Sorry No movie found';
      }
    } on DioException catch (e) {
      throw '${e.message}';
    }
  }
}
