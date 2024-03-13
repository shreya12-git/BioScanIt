import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'finalSignUp.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 37, 43),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 161, 194, 199),
    
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 120,height: 120,),
            Text("Enter the OTP sent on your email"),
            SizedBox(width: 20,height: 20,),
            Center(
              child: Column(
                children: [
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: Color(0xFF194C60), // Corrected the color value
                    // Set to true to show as box or false to show as dash
                    showFieldAsBox: true, 
                    // Runs when a code is typed in
                    onCodeChanged: (String code) {
                      // Handle validation or checks here           
                    },
                    // Runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        },
                      );
                    }, // end onSubmit
                  ),
                  SizedBox(height: 20), // Add SizedBox here
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalSignUpPage(title: "This is final page")));
                    },
                    child: const Text('Verify OTP'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
