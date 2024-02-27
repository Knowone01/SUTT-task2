import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/api/api.dart';

import 'models/movie.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();

}


class _screen1State extends State<screen1> {

  List<dynamic> listResponse = [];
    Future apicall() async {
      http.Response response;
      response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=67ffcd988a3d098f1ec819e7bc14af78'));
      if (response.statusCode == 200){
        setState(() {
          Map mapResponse = jsonDecode(response.body);
         listResponse = mapResponse['results'];
        });
      }
    }
    @override
    void initState(){
      apicall();
      super.initState();
    }

  var moviename = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Center(child: Text("XFilms", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w100, fontSize: 65))),
        backgroundColor: Colors.grey[850],
      ),

      body:
      Column(
        children: [
          SizedBox(
            height: 100
          ),
          Container(
              width: 350,
              padding: EdgeInsets.only(left: 10, top: 50),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: moviename,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)
                  ),

                ),
              ),),
          Padding(
            padding: const EdgeInsets.only(top:8.0, left: 10),
            child: ElevatedButton(onPressed: (){
              String movie_name = moviename.text;
              print(movie_name);
            },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: Text("Search", style: TextStyle(color: Colors.green),)),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left:50.0),
                child: Container(
                  height: 500,
                  width: 500,
                  child: Row(
                    children: [

                      Image.network('https://image.tmdb.org/t/p/w500'+ listResponse[index]['poster_path'])
                    ],
                  ),
                ),
              );
            },
              itemCount: listResponse == null ? 0 : listResponse.length,
          )

          )],

      ),
    );
  }
}
