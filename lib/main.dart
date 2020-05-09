import 'package:flutter/material.dart';
import 'package:flutterappposts/ui/home.dart';

void main() => runApp(BlogApp());

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MI PRIMER APP BLOC',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent,
      ),
    );
  }
}
