import 'package:flutter/material.dart';
import 'package:navigation/view/components/custom_drawer.dart';
import 'package:navigation/view/navigation_bar_taps/navigation_profile_tap.dart';
import 'package:navigation/view/screens/activity.dart';

import '../../model/objects/user.dart';

class CustomNavigationBar extends StatefulWidget {
  final User? user;
  const CustomNavigationBar({super.key, required this.user});

  @override
  State<CustomNavigationBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomNavigationBar> {
  late List<Widget> taps;
  @override
  void initState() {
    taps = [const Activity(), NavProfile(user: widget.user)];
    super.initState();
  }

  int tapIndex = 0;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: taps[tapIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
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
