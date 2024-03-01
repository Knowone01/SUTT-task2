import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
class datamodel extends ChangeNotifier{
  List<dynamic> listResponse = [];
  List <dynamic> get _listresponse => listResponse;
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=67ffcd988a3d098f1ec819e7bc14af78'));
    if (response.statusCode == 200) {
      Map mapResponse = jsonDecode(response.body);
      listResponse = mapResponse['results'];
    };
  }
    String getStringAtIndex(int index) {
      apicall();
      if (index >= 0 && index < listResponse.length) {
        return listResponse[index]['title'];
      }
      return '';
    }





  }
