class MovieDetailModel {
  final String thumb, title, about, genre;
  final double rate;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        thumb = 'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
        about = json['overview'],
        genre = json['genre'],
        rate = json['vote_average'];
}
