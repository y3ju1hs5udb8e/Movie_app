import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/services/movie_service.dart';

final getMovie = FutureProvider.family(
    (ref, String link) => MovieService.getMovie(link: link));

final getVideo =
    FutureProvider.family((ref, int id) => MovieService.getVideo(id: id));
