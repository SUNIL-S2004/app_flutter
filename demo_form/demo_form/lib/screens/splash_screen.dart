import 'dart:async';
import 'dart:convert';

import 'package:demo_form/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List items = [];

  @override
  void initState() {
    initialize();
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>  FormPage()))
        });
  }

  void initialize
      ()async{
    if(mounted) {
      await readJson();
    }
  }

  String appbar_Title="";
  String splash_Image="";

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/config.json');
    final data = await json.decode(response);
    setState(() {
      items = data["SplashScreen"];
      appbar_Title = items[0]["AppName"];
      splash_Image = items[0]["Splash_Img"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(2.5),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff1265a9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                splash_Image??"",
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 50,
              ),
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  appbar_Title??"",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style: TextStyle(shadows: [
                    Shadow(color: Colors.black, offset: Offset(-2, 2))
                  ], fontSize: 25, color: Color(0xF8F9DFD8)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
