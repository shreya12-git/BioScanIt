import 'package:flutter/material.dart';

import 'faceRecognition.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  @override
  Widget build(BuildContext context) {
     final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 1, 37, 43),
      toolbarHeight:50 ,
      iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 161, 194, 199),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Register For Attendance!!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Fullname",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                       
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Registration Number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                       
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Room Number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Room Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                       
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Block Number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Block Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (emailController.text == "awasthi.shreya12@gmail.com" &&
                                passwordController.text == "12345") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  FaceRecognition ()),
                              );
                              //Navigate the user to the HomePage
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Invalid Credentials!!')),
                              );
                            }
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(150, 50),
                            ),
                          ),
                          child: const Text('Take Photo'),
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('After Login Page'),
        backgroundColor: Colors.pink.shade500,
      ),
      body: Column(
        children: [
          const Text('Welcome!'),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go back!"),
            ),
          ),
        ],
      ),
    );
  }
}
