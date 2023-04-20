import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/controller/providers/shared_preference_provider.dart';
import 'package:navigation/view/screens/login.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              // navigate to settings screen
            },
          ),
          ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // actionsAlignment: MainAxisAlignment.spaceAround,
                        actionsPadding:
                            const EdgeInsets.only(bottom: 10, top: 10),
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
                              ref.read(sharedPreferenceProvider).whenData(
                                  (shared) async => await shared
                                      .clear()
                                      .whenComplete(
                                          () => Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Login(),
                                              ),
                                              (route) => false)));
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
