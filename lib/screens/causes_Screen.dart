import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CausesScreen extends StatelessWidget {
  void _launchURL() async {
    const url = "https://climate.nasa.gov/causes/";
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
        title: Text("Causes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(10.0),
                child: Text(
                  "The average temperature of the Earth is rising at nearly twice the rate it was 50 years ago. This rapid warming trend cannot be explained by natural cycles alone, scientists have concluded. The only way to explain the pattern is to include the effect of greenhouse gases (GHGs) emitted by humans."
                  "Current levels of the greenhouse gases carbon dioxide, methane, and nitrous oxide in our atmosphere are higher than at any point over the past 800,000 years, and their ability to trap heat is changing our climate in multiple ways.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset("images/cause.jpg"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Gases that contribute to the greenhouse effect include:",
                softWrap: true,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset("images/cause1.jpg", fit: BoxFit.cover),
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   // padding: const EdgeInsets.all(8.0),
              Text(
                "1.   Water vapor. The most abundant greenhouse gas, but importantly, it acts as a feedback to the climate. Water vapor increases as the Earth's atmosphere warms, but so does the possibility of clouds and precipitation, making these some of the most important feedback mechanisms to the greenhouse effect.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "2.   Carbon dioxide (CO2). A minor but very important component of the atmosphere, carbon dioxide is released through natural processes such as respiration and volcano eruptions and through human activities such as deforestation, land use changes, and burning fossil fuels. Humans have increased atmospheric CO2 concentration by more than a third since the Industrial Revolution began. This is the most important long-lived 'forcing; of climate change.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "3.    Methane. A hydrocarbon gas produced both through natural sources and human activities, including the decomposition of wastes in landfills, agriculture, and especially rice cultivation, as well as ruminant digestion and manure management associated with domestic livestock. On a molecule-for-molecule basis, methane is a far more active greenhouse gas than carbon dioxide, but also one which is much less abundant in the atmosphere.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "4.    Nitrous oxide. A powerful greenhouse gas produced by soil cultivation practices, especially the use of commercial and organic fertilizers, fossil fuel combustion, nitric acid production, and biomass burning.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "5.     Chlorofluorocarbons (CFCs). Synthetic compounds entirely of industrial origin used in a number of applications, but now largely regulated in production and release to the atmosphere by international agreement for their ability to contribute to destruction of the ozone layer. They are also greenhouse gases.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
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

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
