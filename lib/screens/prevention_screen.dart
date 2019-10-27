import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PreventionScreen extends StatelessWidget {
   void _launchURL() async {
    const url = "https://climate.nasa.gov/solutions/resources/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Save Earth"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: ListView(
            children: <Widget>[
              Text(
                "Nations around the world are upping their game in the fight against climate change, even as President Trump recently announced the U.S.'s withdrawal from the Paris Agreement. And despite this reckless move, American mayors, state leaders, county officials, governors, major companies, and millions of citizens across our country have pledged that they're 'still in' when it comes to the agreement, and supporting the goal of limiting future warming to well below 2 degrees Celsius.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Even better, a new initiative by former New York City mayor Michael Bloomberg gives the urban layer of this movement a boost. He’s asked mayors from the 100 most populous cities in the country to share their plans for making their buildings and transportation systems run cleaner and more efficiently. The 20 that show the greatest potential for cutting the dangerous carbon pollution that’s driving climate change will share a total of 70 million in technical assistance funding provided by Bloomberg Philanthropies and partners.",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset("images/prevention.jpg"),
              SizedBox(
                height: 10,
              ),
               Row(
              children: <Widget>[
                Text(
                  "For more information",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Click here",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  onPressed: () {
                    _launchURL();
                  },
                )
              ],
            )
            ],
          ),
        ));
  }
}
