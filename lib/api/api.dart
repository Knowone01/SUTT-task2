import 'dart:convert';

import '../models/movie.dart';
import 'package:http/http.dart'as http;
class Api {
  static const url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=67ffcd988a3d098f1ec819e7bc14af78';

    Future <List<Movie>> nowplaying() async{
    final response = await  http.get(Uri.parse(url));
    if(response .statusCode== 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("error");
    }
  }
}