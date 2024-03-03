import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/sign_in_model.dart';
import 'package:provider/provider.dart';
class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body:
       
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            icon: FaIcon(FontAwesomeIcons.google),
            label: Text("Sign Up with Google"),
            ),
        ),


        );


  }
}

