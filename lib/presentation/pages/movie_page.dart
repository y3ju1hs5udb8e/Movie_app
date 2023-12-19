import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/pages/detail_page.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';

class MoviePage extends ConsumerWidget {
  final String apiLink;
  const MoviePage({super.key, required this.apiLink});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMovie(apiLink));
    return movies.when(
      data: (data) {
        return GridView.builder(
          key: PageStorageKey(apiLink),
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (_, ind) {
            final movie = data[ind];
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => DetailPage(
                    id: movie.id,
                    url: movie.backdrop_path,
                  ),
                  transition: Transition.leftToRightWithFade,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    movie.poster_path,
                    width: 250,
                    height: 200,
                  ),
                  Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      error: (e, s) => Center(child: Text('$e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
