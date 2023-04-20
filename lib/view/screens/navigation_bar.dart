import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/view/components/custom_drawer.dart';
import 'package:navigation/view/navigation_bar_taps/navigation_profile_tap.dart';
import 'package:navigation/view/navigation_bar_taps/activity.dart';
import 'package:navigation/view/navigation_bar_taps/menu.dart';

import '../../model/objects/user.dart';

class CustomNavigationBar extends ConsumerWidget {
  final User? user;
   CustomNavigationBar({super.key, required this.user});
  late List<Widget> taps;
    taps = [const MyMenu(), const Activity(), NavProfile(user: widget.user)];
  int tapIndex = 0;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: taps[tapIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Me')
        ],
        currentIndex: tapIndex, // to active selected tap in navigationBar
        onTap: (index) {
          setState(() {
            tapIndex = index;
          });
        },
      ),
    );
  }
}





