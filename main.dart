import 'package:covid_19_tracker_app_project/app/UI/dashboard.dart';
import 'package:covid_19_tracker_app_project/app/repositories/data_repository.dart';
import 'package:covid_19_tracker_app_project/app/services/api.dart';
import 'package:covid_19_tracker_app_project/app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(API.sandbox())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFFF5F5F5),
          cardColor: Colors.teal[800].withOpacity(0.6),
        ),
        home: Dashboard(),
      ),
    );
  }
}
