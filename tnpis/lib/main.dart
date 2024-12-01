import 'package:flutter/material.dart';
import 'splash.dart';
import 'dawer.dart';
import 'login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash_app(),
        '/login': (context) => MyHomePage(),
        '/menu': (context) => Dawer_app()
      },
    ),
  );
}
