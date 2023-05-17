import 'package:flutter/material.dart';
import 'package:weather_app/pages/PageOne.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: PageOne(),
      // home: Dashboard(),
    );
  }
}
