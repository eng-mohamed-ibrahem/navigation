import 'package:flutter/material.dart';
import 'package:navigation/view/screens/login.dart';
import 'package:navigation/view/screens/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() async {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        // return SharedPrefController(pref: preferences).getUser;
        return preferences.getString('user');
      },
    ).then((user) {
      if (user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const CustomNavigationBar(),
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
            style: TextStyle(
                color:  Color.fromRGBO(114, 82, 219, 1),
                fontSize: 50),
          ),
        ),
      ),
    );
  }
}
