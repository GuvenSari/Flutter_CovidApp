import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String title;
  const UserCard({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(this.title),
      leading: IconButton(
          icon: Icon(Icons.cast_for_education_outlined), onPressed: null),
    );
  }
}
