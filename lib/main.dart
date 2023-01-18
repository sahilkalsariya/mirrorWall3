import 'package:flutter/material.dart';
import 'package:mirrorwall_3/amazon.dart';
import 'package:mirrorwall_3/hotStar.dart';
import 'package:mirrorwall_3/primeVedio.dart';
import 'package:mirrorwall_3/sonyLive.dart';
import 'package:mirrorwall_3/zeeTv.dart';

import 'netFlix.dart';
import 'ottPlatform.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
        '/' : (context) => MyApp(),
       'netflix' : (context) => netFlix(),
       'primeVedio' : (context) => primeVedio(),
       'hotStar' : (context) => hotStar(),
       'amazon' : (context) => amazon(),
       'sonyLive' : (context) => sonyLive(),
       'zeeTv' : (context) => zeeTv(),
       'ottPlatform' : (context) => ottPlatform(),
     },
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("OTT Plateform")),
          ElevatedButton(onPressed: (){}, child: Text("Education"))
        ],
      ),
    );
  }
}
