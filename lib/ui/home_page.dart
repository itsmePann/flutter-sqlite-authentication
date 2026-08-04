import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("HALAMAN UTAMA", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
