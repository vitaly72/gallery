import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/screens/HomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Gallery';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}