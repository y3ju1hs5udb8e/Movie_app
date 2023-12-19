import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/presentation/widgets/video_widget.dart';

class DetailPage extends ConsumerWidget {
  final String url;
  final int id;
  const DetailPage({super.key, required this.url, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(getVideo(id));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(
          top: 50,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: NetworkImage(url),
          ),
        ),
        child: movie.when(
          data: (data) {
            return Column(
              children: [
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 250,
                  child: VideoWidget(video: data[0]),
                ),
                Text(
                  data[0].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            );
          },
          error: (e, s) => Center(child: Text('$e')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
