class Movie {
  final String backdrop_path;
  final String title;
  final String overview;
  final String poster_path;
  final String vote_average;
  final int id;

  Movie({
    required this.backdrop_path,
    required this.title,
    required this.id,
    required this.overview,
    required this.poster_path,
    required this.vote_average,
  });

  factory Movie.formJson(Map<String, dynamic> json) {
    return Movie(
        backdrop_path:
            'https://image.tmdb.org/t/p/w500/${json['backdrop_path']}',
        title: json['title'],
        id: json['id'],
        overview: json['overview'],
        poster_path:
            'https://image.tmdb.org/t/p/w500/${json['poster_path'] ?? '/bkpPTZUdq31UGDovmszsg2CchiI.jpg'}',
        vote_average: json['vote_average'].toString());
  }
}
