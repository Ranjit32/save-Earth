import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RankingScreen extends StatelessWidget {
  void _launchURL() async {
    const url =
        'https://www.weforum.org/agenda/2019/06/chart-of-the-day-these-countries-create-most-of-the-world-s-co2-emissions/';
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
        title: Text(
          "Ranking",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Rankings",

            Text(
              "How much CO₂ does your country emit per capita (person)? And how does it compare with the rest of the world?"
              "This chart by Statista highlights the enormous variations between the major world economies in CO₂ emissions measured at the individual level.",
              style: TextStyle(
                fontSize: 16,
              ),
              softWrap: true,
            ),
            SizedBox(
              height: 12.0,
            ),
            Image.asset("images/rankings.png"),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Just two countries, China and the US, are responsible for more than 40% of the world’s CO2 emissions."
              "With CO2 levels still on the rise, being able to track the global emissions hotspots is becoming more important than ever. Before the industrial revolution, levels of atmospheric CO2 were around 280 parts per million (ppm). By 2013, that level had breached the 400ppm mark for the first time."
              "On 3 June 2019 it stood at 414.40ppm.",
              style: TextStyle(
                fontSize: 16,
              ),
              softWrap: true,
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
