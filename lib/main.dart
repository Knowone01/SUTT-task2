import 'package:flutter/material.dart';
import 'package:movies/screen2_.dart';
import 'package:movies/sign_in_model.dart';
import 'package:movies/splashscreen.dart';
import 'package:movies/model.dart';
import 'package:provider/provider.dart';
import 'package:movies/screen1.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
     print("fire basenfjeno");
  }  catch (e) {
    print("error is this $e");
  }
  runApp(
    MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => datamodel(),),
    ChangeNotifierProvider(create: (context) => datamodel1()),
    ChangeNotifierProvider(create: (context) => MovieData()),
      ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
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



