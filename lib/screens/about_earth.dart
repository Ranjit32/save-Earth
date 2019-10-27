import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutEarth extends StatelessWidget {
  void _launchURL() async {
    const url = "https://solarsystem.nasa.gov/planets/earth/overview/";
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
        title: Text("About Earth"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: <Widget>[
            Image.asset(
              "images/earth.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Our home planet is the third planet from the Sun, and the only place we know of so far that’s inhabited by living things."
              "While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface. Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal."
              "The name Earth is at least 1,000 years old. All of the planets, except for Earth, were named after Greek and Roman gods and goddesses. However, the name Earth is a Germanic word, which simply means “the ground.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Did You Know?",
              softWrap: true,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "images/earth1.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Laika the dog was the first Earthling to orbit Earth aboard the Soviet Union's Sputnik 2 in 1957. She did not survive the trip. A few years later, the next two Soviet space dogs—Belka and Strelka—became the first living creatures to return from space alive—paving the way for future human explorers.",
              style: TextStyle(
                fontSize: 17,
              ),
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
      ),
    );
  }
}
