import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Image.asset(
            '../assets/images/flutter_image.jpg',
            height: 150,
          ),
          const SizedBox(
            height: 30,
          ),
          
        ],
      ),
    );
  }
}
