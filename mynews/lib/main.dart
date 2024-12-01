import 'package:flutter/material.dart';
import 'home.dart';
import 'countries.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        Countries.router: (context) => Countries(),
      },
    );
  }
}
