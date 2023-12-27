import 'package:flutter/material.dart';
import 'package:movie_challenge/models/nowmovie_model.dart';
import 'package:movie_challenge/models/popmovie_model.dart';
import 'package:movie_challenge/models/soonmovie_model.dart';
import 'package:movie_challenge/services/api_service.dart';
import 'package:movie_challenge/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopMovieModel>> popmovies = ApiService.getPopMovies();
  final Future<List<NowMovieModel>> nowmovies = ApiService.getNowMovies();
  final Future<List<SoonMovieModel>> soonmovies = ApiService.getSoonMoveis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
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
                    return SizedBox(
                      height: 200,
                      // decoration:
                      // const BoxDecoration(color: Colors.amberAccent),
                      // 식별 편하게 잠시 색깔을 넣음.
                      child: makeList(snapshot),
                    );
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
                        child: makeList2(snapshot2));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 10,
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
                        child: makeList3(snapshot3));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
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
      return Movie(type: '$popmovie', thumb: popmovie.thumb, id: popmovie.id);
      // Text(popmovie.title);
    },
    separatorBuilder: ((context, index) => const SizedBox(
          width: 20,
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
            Movie(type: '$nowmovie', thumb: nowmovie.thumb, id: nowmovie.id),
            const SizedBox(height: 5),
            Text(
              nowmovie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 20,
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
            Movie(type: '$soonmovie', thumb: soonmovie.thumb, id: soonmovie.id),
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
      width: 20,
    ),
  );
}
