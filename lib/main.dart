import 'package:flutter/material.dart';
import 'package:movies/splashscreen.dart';
import 'package:movies/model.dart';
import 'package:provider/provider.dart';
import 'package:movies/screen1.dart';

void main() {
  runApp(
    MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => datamodel(),),
    ChangeNotifierProvider(create: (context) => datamodel1())
        ],
        child: MyApp(),

    ),


  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}



