import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';
import 'signUp.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 80, height: 80),
            Text("BioScanIt", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500), // Adjust border radius as needed
                child: Image.asset(
                  'assets/Picture1.png',
                  width: 350,
                  height: 350,
                ),
              ),
            ),
            SizedBox(width: 10, height: 10),
            Text("Welcome to Our Biometric Attendance System!!!", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(width: 10, height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage(title: 'Login Page')),
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(200, 50),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage(title: 'SignUp Page')),
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(200, 50),
                    ),
                  ),
                  child: const Text('Register'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: 'Welcome to BioScanIt!!',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Attendance Made Easier!!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 233, 125, 161),
    );
  }
}
