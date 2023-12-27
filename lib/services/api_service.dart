import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_challenge/models/detail_model.dart';
import 'package:movie_challenge/models/nowmovie_model.dart';
import 'package:movie_challenge/models/popmovie_model.dart';
import 'package:movie_challenge/models/soonmovie_model.dart';

class ApiService {
  static const baseURL = "https://movies-api.nomadcoders.workers.dev";
  static const popular = "popular";
  static const playnow = "now-playing";
  static const comingsoon = "coming-soon";
// jsonDecode(utf8.decode(response.bodyBytes));
  static Future<List<PopMovieModel>> getPopMovies() async {
    List<PopMovieModel> popmovieInstances = [];
    final url = Uri.parse('$baseURL/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> popmovies = responseData['results'];
      for (var popmovie in popmovies) {
        popmovieInstances.add(
          PopMovieModel.fromJson(popmovie),
        );
      }
      return popmovieInstances;
    }
    throw Error();
  }

  static Future<List<NowMovieModel>> getNowMovies() async {
    List<NowMovieModel> nowmovieInstances = [];
    final url = Uri.parse('$baseURL/$playnow');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> nowmovies = responseData['results'];
      for (var nowmovie in nowmovies) {
        nowmovieInstances.add(
          NowMovieModel.fromJson(nowmovie),
        );
      }
      return nowmovieInstances;
    }
    throw Error();
  }

  static Future<List<SoonMovieModel>> getSoonMoveis() async {
    List<SoonMovieModel> soonmovieInstances = [];
    final url = Uri.parse('$baseURL/$comingsoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> soonmovies = responseData['results'];
      for (var soonmovie in soonmovies) {
        soonmovieInstances.add(
          SoonMovieModel.fromJson(soonmovie),
        );
      }
      return soonmovieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getDetailById(int id) async {
    final url = Uri.parse('$baseURL/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final detail = jsonDecode(utf8.decode(response.bodyBytes));
      // print(detail);
      return MovieDetailModel.fromJson(detail);
    }
    throw Error();
  }
}
