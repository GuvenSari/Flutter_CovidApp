import 'package:covid_19_tracker_app_project/app/UI/AboutUs.dart';
import 'package:covid_19_tracker_app_project/app/UI/endpoint_card.dart';
import 'package:covid_19_tracker_app_project/app/UI/preventions.dart';
import 'package:covid_19_tracker_app_project/app/UI/symptoms.dart';
import 'package:covid_19_tracker_app_project/app/repositories/data_repository.dart';
import 'package:covid_19_tracker_app_project/app/repositories/endpoints_data.dart';
import 'package:covid_19_tracker_app_project/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/material/icons.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();
    setState(() => _endpointsData = endpointsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/covid.png"),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                _ourUniversity();
                Navigator.of(context).pop();
              },
              child: Text(
                'Our University Home Page',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {
                _youtubePresentation();
              },
              child: Text(
                'Our App Presentation',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs())),
              child: Text(
                'About Us',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text('Covid-19 App')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coronavirus_sharp),
            tooltip: 'Check "World Health Organization" website',
            onPressed: _launchURL,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint]
                    : null,
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text("Preventions advice",
                      style: TextStyle(
                          height: 1.3,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    PreventitonCard(
                      image: "assets/img/hand.png",
                      title: "Wash Hands",
                    ),
                    PreventitonCard(
                      image: "assets/img/wear.png",
                      title: "Use Masks",
                    ),
                    PreventitonCard(
                      image: "assets/img/clean.png",
                      title: "Clean Disinfect",
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text("Attention to these symptoms",
                  style: TextStyle(
                      height: 2,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, top: 05, right: 20, bottom: 20),
                  child: SymptomsCard(
                    image: "assets/img/symptoms.png",
                    title:
                        "Call your doctor if you have any of these symptoms!",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://covid19.who.int/?gclid=CjwKCAiAsaOBBhA4EiwAo0_AnDo2jLrTMXcIAFE1-FaMC-z1mexCKQ68SHtioTJ2bMiVxjT9DKZ8thoCfIUQAvD_BwE';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_ourUniversity() async {
  const university = 'https://www.ieu.edu.tr/tr';
  if (await canLaunch(university)) {
    await launch(university);
  } else {
    throw 'Could not launch $university';
  }
}

_youtubePresentation() async {
  const presentation = 'https://www.youtube.com/watch?v=aahdW4c0OxM';
  if (await canLaunch(presentation)) {
    await launch(presentation);
  } else {
    throw 'Could not launch $presentation';
  }
}
