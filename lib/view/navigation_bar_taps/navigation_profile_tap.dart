import 'package:flutter/material.dart';

class NavProfile extends StatelessWidget {
  const NavProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('../assets/images/profile.png'),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.camera_alt_outlined)),
              ],
            ),
          ),
          const Text('my name'),
        ],
      ),
    );
  }
}
