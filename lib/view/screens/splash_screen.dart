import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/view/screens/login.dart';
import 'package:navigation/view/screens/navigation_bar.dart';
import '../../controller/providers/user_state_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)  {
    // final user = ref.read(userStateProvider);
    Future(() {
        ref.watch(userStateProvider);
    }).then((user) {
      if (user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => CustomNavigationBar(),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
            (route) => false);
      }
    });

    return Scaffold(
      body: Image.asset(
        'assets/images/flutter_image.jpg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
