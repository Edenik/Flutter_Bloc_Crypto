import 'package:flutter/material.dart';
import 'package:flutter_bloc_crypto/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crypto App',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.tealAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
