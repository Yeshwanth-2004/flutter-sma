import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/mobile.dart';
import 'package:flutter_application_3/myown.dart';
import 'package:flutter_application_3/play%20courses.dart';
import 'package:google_fonts/google_fonts.dart';


void main(){
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:loginmob(),
     /*  theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(), // Set Roboto as the default font
      ), */
      debugShowCheckedModeBanner: false,
      /* theme:ThemeData(
        textTheme: 
      ), */
    );
  }
}