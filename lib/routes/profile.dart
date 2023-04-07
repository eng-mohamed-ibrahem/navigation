import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
             const Text('This is Profile Page '),
             ElevatedButton(onPressed: (){
              Navigator.pop(context);
             }, child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}