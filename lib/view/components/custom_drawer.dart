import 'package:flutter/material.dart';
import 'package:navigation/view/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  child: Image.asset('assets/images/profile.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('')
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            //when drawer is opened, flutter adds it to navigation stack(MatrialPageRoute)
            onTap: () {
              Navigator.pop(context);
              // navigate to screen
            },
          ),
          ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () {
                // Navigator.pop(context);

                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text('Log Out'),
                        content: const Text('Are you sure to logout ?'),
                        actions: [
                          ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel')),
                          ElevatedButton(
                            onPressed: () async {
                              // clear cach data
                              await SharedPreferences.getInstance()
                                  .then((value) {
                                value.clear().then((value) => {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Login(),
                                          ),
                                          (route) => false)
                                    });
                              });
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}
