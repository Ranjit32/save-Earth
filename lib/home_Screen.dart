import 'package:flutter/material.dart';
import 'package:save_Earth/mr_earth/earth.dart';
import 'package:save_Earth/screens/about_earth.dart';
import 'package:save_Earth/screens/causes_Screen.dart';
import 'package:save_Earth/screens/effect_Screen.dart';
import 'package:save_Earth/screens/info_screen.dart';
import 'package:save_Earth/story_brain.dart';

import 'screens/event_Screen.dart';
import 'screens/prevention_screen.dart';
import 'screens/ranking_Screen.dart';
import 'weather/screens/loading_screen.dart';

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  static const routeName = "/home";
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Widget buildListTile(IconData icon, String title, Function onPressed) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18.0,
        child: Icon(
          icon,
          size: 25.0,
        ),
      ),
      title: Text(title),
      onTap: onPressed,
    );
  }

  int storyIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Earth"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.speaker_notes, color: Colors.blue),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePageDialogflow(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.offline_bolt, color: Colors.red),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoadingScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 11,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 3,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/image1.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              accountName: Text(
                "Climate Change",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            buildListTile(
              Icons.home,
              "Home",
              () {
                Navigator.of(context).pop();
              },
            ),
             buildListTile(
              Icons.star,
              "More about Earth",
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AboutEarth(),
                  ),
                );
              },
            ),
            buildListTile(
              Icons.assessment,
              "Rankings",
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RankingScreen(),
                  ),
                );
              },
            ),
            buildListTile(
              Icons.event,
              "Events",
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventScreen(),
                  ),
                );
              },
            ),
            buildListTile(
              Icons.compare,
              "Causes",
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CausesScreen(),
                  ),
                );
              },
            ),
            buildListTile(
              Icons.donut_small,
              "Effects",
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EffectScreen(),
                  ),
                );
              },
            ),
            buildListTile(
              Icons.control_point,
              "Prevention",
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PreventionScreen(),
                  ),
                );
              },
            ),
            buildListTile(
              Icons.info,
              "About App",
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
