import 'package:flutter/material.dart';
import 'package:mirrorwall_3/amazon.dart';
import 'package:mirrorwall_3/hotStar.dart';
import 'package:mirrorwall_3/primeVedio.dart';
import 'package:mirrorwall_3/sonyLive.dart';
import 'package:mirrorwall_3/zeeTv.dart';

import 'netFlix.dart';

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
      appBar: AppBar(
        title: Text("Mirroor Wall",style: TextStyle(
          color: Colors.white,fontSize: 25,
        ),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image : AssetImage("assets/myimage/blur_colors-1366x768.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          children: [
            ottRow("netflix", "assets/myimage/netflix_PNG10.png", "NETFLIX"),
            ottRow("primeVedio", "assets/myimage/amazon-prime-logo-0.png", "AMAZON PRIME"),
            ottRow("hotStar", "assets/myimage/hotstar.png", "HOTSTAR"),
            ottRow("amazon", "assets/myimage/amazon-logo-1.png", "AMAZON"),
            ottRow("sonyLive", "assets/myimage/sonyLiv.png", "SONY LIV"),
            ottRow("zeeTv", "assets/myimage/zee5.png", "Zee5"),
          ],
        ),
      ),
    );
  }

  GestureDetector ottRow (String pageKey,String logo,String name){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(pageKey);
      },
      child: Container(
        child: Column(
          children: [
            Image.asset(logo,height: 170),
            SizedBox(height: 5),
            Text(name,style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
    );
  }
}
