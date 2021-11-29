import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: ListView(
        children: [
          Card(
              child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () async {
                    const url = 'https://github.com/IlaydaMutlu';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw ('Could not launch $url');
                    }
                  },
                ),
                title: Text(
                  'İlayda MUTLU',
                  style: TextStyle(fontFamily: 'Times'),
                ),
                subtitle: Text(
                  'Software Engineering Student',
                  style: TextStyle(
                    fontFamily: 'Times',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'ilaydaamutlu@hotmail.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: 'Times',
                  ),
                ),
              )
            ],
          )),
          Card(
              child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () async {
                    const url = 'https://github.com/GuvenSari';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw ('Could not launch $url');
                    }
                  },
                ),
                title: Text(
                  'Güven SARI',
                  style: TextStyle(fontFamily: 'Times'),
                ),
                subtitle: Text(
                  'Software Engineering Student',
                  style: TextStyle(
                    fontFamily: 'Times',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'sarigüven@gmail.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: 'Times',
                  ),
                ),
              ),
            ],
          )),
          Card(
              child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () async {
                    const url = 'https://github.com/ilker-ekin';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw ('Could not launch $url');
                    }
                  },
                ),
                title: Text(
                  'İlker Ekin ERDOĞDU',
                  style: TextStyle(fontFamily: 'Times'),
                ),
                subtitle: Text(
                  'Software Engineering Student',
                  style: TextStyle(
                    fontFamily: 'Times',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'ilkerekinx@gmail.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: 'Times',
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
