import 'package:flutter/material.dart';
import 'package:movie_challenge/models/nowmovie_model.dart';
import 'package:movie_challenge/models/popmovie_model.dart';
import 'package:movie_challenge/models/soonmovie_model.dart';
import 'package:movie_challenge/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopMovieModel>> popmovies = ApiService.getPopMovies();
  final Future<List<NowMovieModel>> nowmovies = ApiService.getNowMovies();
  final Future<List<SoonMovieModel>> soonmovies = ApiService.getSoonMoveis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular Movies',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: popmovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            height: 300,
                            decoration: const BoxDecoration(),
                            child: Expanded(child: makeList(snapshot)));
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Now in Cinemas',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: nowmovies,
                    builder: (context, snapshot2) {
                      if (snapshot2.hasData) {
                        return Container(
                            height: 300,
                            decoration: const BoxDecoration(),
                            child: Expanded(child: makeList2(snapshot2)));
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Coming Soon',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: soonmovies,
                    builder: (context, snapshot3) {
                      if (snapshot3.hasData) {
                        return Container(
                            height: 300,
                            decoration: const BoxDecoration(),
                            child: Expanded(child: makeList3(snapshot3)));
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ListView makeList(AsyncSnapshot<List<PopMovieModel>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      // print(index);
      var popmovie = snapshot.data![index];
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          popmovie.thumb,
        ),
      );
      // Text(popmovie.title);
    },
    separatorBuilder: ((context, index) => const SizedBox(
          width: 30,
        )),
  );
}

ListView makeList2(AsyncSnapshot<List<NowMovieModel>> snapshot2) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot2.data!.length,
    itemBuilder: (context, index) {
      var nowmovie = snapshot2.data![index];
      return SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Take the full width available
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                nowmovie.thumb,
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
            const SizedBox(height: 5),
            Text(
              nowmovie.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 10,
    ),
  );
}

ListView makeList3(AsyncSnapshot<List<SoonMovieModel>> snapshot3) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot3.data!.length,
    itemBuilder: (context, index) {
      var soonmovie = snapshot3.data![index];
      return SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Take the full width available
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                soonmovie.thumb,
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
            const SizedBox(height: 5),
            Text(
              soonmovie.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 10,
    ),
  );
}
