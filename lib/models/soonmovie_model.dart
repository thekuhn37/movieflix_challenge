class SoonMovieModel {
  final String title, thumb;
  final int id;

  SoonMovieModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        thumb = 'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
        id = json['id'];
}
