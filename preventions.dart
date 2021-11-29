import 'package:flutter/material.dart';

class PreventitonCard extends StatelessWidget {
  final String image;
  final String title;
  const PreventitonCard({Key key, this.image, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Image.asset(image, height: 50, width: 100),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
