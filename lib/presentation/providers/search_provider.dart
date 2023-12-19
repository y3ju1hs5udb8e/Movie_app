import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

final searchProvider = AsyncNotifierProvider(() => SearchProvider());

class SearchProvider extends AsyncNotifier {
  @override
  Future<List<Movie>> build() async {
    return [];
  }

  Future<void> search(String query) async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => MovieService.searchVideo(query: query));
  }
}
