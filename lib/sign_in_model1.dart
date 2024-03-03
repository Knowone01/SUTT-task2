import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/screen1.dart';
import 'package:movies/sign_in.dart';


class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return screen1();
          }
          else if(snapshot.hasError){
            return Center(child: Text("Something went wrong..."),);
          }
          else{
            return signin();
          }
          },
      ),
    );
  }
}
