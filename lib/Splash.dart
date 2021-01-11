import 'dart:async';

import 'package:covid19app/First.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 5),()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>First())));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Image.asset('Images/coronavirus.png')),
            ),
            SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Covid\nTracker',
                      style: TextStyle(
                        // fontFamily: 'IndieFlower',
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(170.0, 150.0, 0.0, 0.0),
                      child: Loader(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 6.0,
      backgroundColor: Colors.black,
    );
  }
}
