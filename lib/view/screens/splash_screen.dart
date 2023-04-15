import 'package:flutter/material.dart';
import 'package:navigation/view/screens/login.dart';
import 'package:navigation/view/screens/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/shared_preference_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() async {
    SharedPrefController prefController =
        SharedPrefController(pref: await SharedPreferences.getInstance());
    // i dont use await because i want to exceed to build method until finsh future code
    prefController.getUser().then((user) {
      if (user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => CustomNavigationBar(
                user: user,
              ),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
            (route) => false);
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            'Navigation',
            style:
                TextStyle(color: Color.fromRGBO(114, 82, 219, 1), fontSize: 50),
          ),
        ),
      ),
    );
  }
}
