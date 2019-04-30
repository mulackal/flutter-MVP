import 'package:flutter/material.dart';
import 'package:flutter_app_mvp/ui/home/home_pages.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Flutter MVP',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomePages(),
        debugShowCheckedModeBanner: false
    );

  }

}