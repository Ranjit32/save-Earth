import 'package:flutter/material.dart';
import 'package:save_Earth/home_Screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Earth"),
        elevation: 5.0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "images/slogan.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              child: Text(
                "Start",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => StoryPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
