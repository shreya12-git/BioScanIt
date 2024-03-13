import 'dart:async';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'login.dart';
import 'signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioScanIt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan.shade700),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.cyan.shade100,
        body: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

