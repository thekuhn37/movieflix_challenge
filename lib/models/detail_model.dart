class MovieDetailModel {
  final String poster, title, about, genre;
  final double rate;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        /* Access 'name' inside 'belongs_to_collection' map 하는 방법 : 
        json['belongs_to_collection']?['name'] ?? "", // Access 'name' inside 'belongs_to_collection' map */
        poster = 'https://image.tmdb.org/t/p/w500/${json['backdrop_path']}',
        about = json['overview'],
        genre = json['genres']?.map((genre) => genre['name']).join(', ') ??
            "", // Assuming genres is a list
        rate = (json['vote_average'] as num)
            .toDouble(); // Parse 'vote_average' as double
}
