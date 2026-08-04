import 'package:authentication/ui/loginpage.dart';
// import 'package:authentication/ui/registerpage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple)
      ),
      home: Loginpage(),
    );
  }
}


