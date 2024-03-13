import 'package:flutter/material.dart';
import 'otp.dart';
import 'login.dart';
import 'register.dart'; // Import the login page

void main() {
  runApp(const FinalSignUp());
}

class FinalSignUp extends StatelessWidget {
  const FinalSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignUp App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade500),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFBF1F1),
      ),
      home: const FinalSignUpPage(title: 'FinalSignUp Page'),
    );
  }
}

class FinalSignUpPage extends StatefulWidget {
  const FinalSignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<FinalSignUpPage> createState() => _FinalSignUpPageState();
}

class _FinalSignUpPageState extends State<FinalSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 37, 43),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 161, 194, 199),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50, // Set the height of the SizedBox
              width: double.infinity,
            ), // Add SizedBox with height
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20, // Set the height of the SizedBox
              width: double.infinity,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          print(value);
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter The Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context)=>const RegisterPage(title: 'Register page',)));
                          },
                          child: const Text('Register '),
                        ),
                      ),
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
