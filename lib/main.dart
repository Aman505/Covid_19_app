import 'package:covid19app/First.dart';
import 'package:covid19app/Splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covid19app/second.dart';

import 'Help.dart';
void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/' : (context)=>Splash(),
    '/second': (context)=>second(),
  },
));


