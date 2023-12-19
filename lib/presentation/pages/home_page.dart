import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/constant/api.dart';
import 'package:movie_app/presentation/pages/movie_page.dart';
import 'package:movie_app/presentation/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 850),
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Get.to(() => SearchPage());
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Popular'),
              ),
              Tab(
                child: Text('Upcoming'),
              ),
              Tab(
                child: Text('Top Rated'),
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12.0),
          child: TabBarView(
            children: [
              MoviePage(apiLink: ApiLink.popular),
              MoviePage(apiLink: ApiLink.upcomming),
              MoviePage(apiLink: ApiLink.topRated),
            ],
          ),
        ),
      ),
    );
  }
}
