class NowMovieModel {
  final String title, thumb;
  final int id;

  NowMovieModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        thumb = 'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
        id = json['id'];
}
