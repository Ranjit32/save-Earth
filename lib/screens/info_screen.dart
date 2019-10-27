import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String email = "ranjeetbudhathoki32@gmail.com";

  void sendEmail() async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 60,
              ),
              radius: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "This app is developed by Ranjit and Imosh(Team Vision) in nasa space app challenge 2019, Biratnagar."
              "This app is education based where users can know more about earth and the problems in earth."
              "You can also create trash cleaning event and even play a simple game which talks about deforestation and climate change."
              "For more information about the app check this app.If you have any queries about this app,you can email us.",
              style: TextStyle(fontSize: 20.0),
              softWrap: true,
            ),
            Center(
              child: RaisedButton(
                child: Text("Send Email"),
                onPressed: () {
                  sendEmail();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Be the part of the solution, not the part of the pollution..",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
