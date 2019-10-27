import 'package:flutter/material.dart';
import 'package:save_Earth/screens/first_Screen.dart';


void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // initialRoute: "/",
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
      // r
    );
  }
}
