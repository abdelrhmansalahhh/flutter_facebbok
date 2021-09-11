import 'package:flutter/material.dart';
import 'package:flutter_facebook/cofig/palette.dart';
import 'package:flutter_facebook/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
         scaffoldBackgroundColor: Palette.scaffold
      ),
      home:HomeScreen(),
    );
  }
}
 