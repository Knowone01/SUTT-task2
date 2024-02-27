
class Movie {
  String original_title;
  String adult;
  String overview;
  String backdrop_path;
  String release_date;


  Movie({
    required this.original_title,
    required this.adult,
    required this.overview,
    required this.backdrop_path,
    required this.release_date
  });

  factory Movie.fromJson(Map<String, dynamic>json){
    return Movie(
        original_title: json["original_title"],
        adult: json["adult"],
        overview:json["overview"] ,
        backdrop_path:json["backdrop_path"] ,
        release_date: json["release_date"],



    );
  }


}