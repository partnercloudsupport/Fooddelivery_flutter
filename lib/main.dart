import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fooddelivery/Login/LoginPage.dart';

var apiKey = "AIzaSyAqxqnsuGk6EdkLEgsNrDmqzlJtH-dFnaY";

void main() {

 runApp(new MaterialApp(  
      theme: ThemeData(
      primarySwatch: Colors.blue, accentColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
   _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {

  @override
  void initState() {
  super.initState();
  const twentyMillis = const Duration(milliseconds:3600);
  new Timer(twentyMillis, () => 
      Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new LoginPage(),
                ),
            ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Colors.blueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: new Icon(
                          Icons.fastfood,
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text("Quadratics",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    new Text("Food",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
