import 'dart:ui';
import 'package:flutter/material.dart';

class Splash_app extends StatefulWidget {
  const Splash_app({super.key});

  @override
  State<Splash_app> createState() => _Splash_appState();
}

class _Splash_appState extends State<Splash_app> {
  @override
  void initState() {
    onchange();
    super.initState();
  }

  onchange() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.all(1.0),
      //     child: Image.asset('assets/images/emblem-light.jpg'),
      //   ),
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(1.0),
      //       child: Image.asset('assets/images/Digital_India_logo.svg.png'),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF822FFF),
                Color(0xff05FF03),
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo-light1.png',
                height: 180,
                width: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Pensioners Information System",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text('Version 1.0', style: TextStyle(fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
