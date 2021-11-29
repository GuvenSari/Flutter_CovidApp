import 'package:flutter/material.dart';

class SymptomsCard extends StatelessWidget {
  final String image;
  final String title;
  const SymptomsCard({Key key, this.image, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Image.asset(image, height: 150, width: 350),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.1),
        ),
      ],
    );
  }
}
