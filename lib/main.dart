import 'package:flutter/material.dart';
import 'package:local_event_meetup/ui/home_page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Colors.pinkAccent,
      ),
      home: HomePage(),
    );
  }
}
