import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EffectScreen extends StatelessWidget {
  void _launchURL() async {
    const url = "https://climate.nasa.gov/effects/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  var box = SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Effects"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Global climate change has already had observable effects on the environment. Glaciers have shrunk, ice on rivers and lakes is breaking up earlier, plant and animal ranges have shifted and trees are flowering sooner."
              "Effects that scientists had predicted in the past would result from global climate change are now occurring: loss of sea ice, accelerated sea level rise and longer, more intense heat waves.",
              style: TextStyle(fontSize: 17),
            ),
            Image.asset(
              "images/effect.jpg",
              fit: BoxFit.contain,
            ),
            Text(
              "Scientists have high confidence that global temperatures will continue to rise for decades to come, largely due to greenhouse gases produced by human activities. The Intergovernmental Panel on Climate Change (IPCC), which includes more than 1,300 scientists from the United States and other countries, forecasts a temperature rise of 2.5 to 10 degrees Fahrenheit over the next century."
              "According to the IPCC, the extent of climate change effects on individual regions will vary over time and with the ability of different societal and environmental systems to mitigate or adapt to change."
              "The IPCC predicts that increases in global mean temperature of less than 1.8 to 5.4 degrees Fahrenheit (1 to 3 degrees Celsius) above 1990 levels will produce beneficial impacts in some regions and harmful ones in others. Net annual costs will increase over time as global temperatures increase."
              "Taken as a whole,' the IPCC states, 'the range of published evidence indicates that the net damage costs of climate change are likely to be significant and to increase over time.",
              style: TextStyle(fontSize: 17),
            ),
            Text(
              "Future Effects",
              softWrap: true,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            box,
            Text(
              "Some of the long-term effects of global climate change in the United States are as follows, according to the Third and Fourth National Climate Assessment Reports:",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Change Will Continue Through This Century and Beyond",
              softWrap: true,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            box,
            Image.asset(
              "images/effect1.jpeg",
              fit: BoxFit.cover,
            ),
            box,
            Text(
              "Global climate is projected to continue to change over this century and beyond. The magnitude of climate change beyond the next few decades depends primarily on the amount of heat-trapping gases emitted globally, and how sensitive the Earth’s climate is to those emissions.",
              style: TextStyle(fontSize: 15),
            ),
            box,
            Text(
              "Temperatures Will Continue to Rise",
              softWrap: true,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            box,
            Image.asset(
              "images/effect2.jpeg",
              fit: BoxFit.cover,
            ),
            box,
            Text(
              "Global climate is projected to continue to change over this century and beyond. The magnitude of climate change beyond the next few decades depends primarily on the amount of heat-trapping gases emitted globally, and how sensitive the Earth’s climate is to those emissions.",
              style: TextStyle(fontSize: 15),
            ),
            box,
            Text(
              "Frost-free Season (and Growing Season) will Lengthen",
              softWrap: true,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            box,
            Image.asset(
              "images/effect3.jpeg",
              fit: BoxFit.cover,
            ),
            box,
            Text(
              "The length of the frost-free season (and the corresponding growing season) has been increasing nationally since the 1980s, with the largest increases occurring in the western United States, affecting ecosystems and agriculture. Across the United States, the growing season is projected to continue to lengthen."
              "In a future in which heat-trapping gas emissions continue to grow, increases of a month or more in the lengths of the frost-free and growing seasons are projected across most of the U.S. by the end of the century, with slightly smaller increases in the northern Great Plains. The largest increases in the frost-free season (more than eight weeks) are projected for the western U.S., particularly in high elevation and coastal areas. The increases will be considerably smaller if heat-trapping gas emissions are reduced.",
              style: TextStyle(fontSize: 15),
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
            ),
          ],
        ),
      ),
    );
  }
}
