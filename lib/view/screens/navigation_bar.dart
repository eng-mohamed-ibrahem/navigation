import 'package:flutter/material.dart';
import 'package:navigation/view/navigation_bar_taps/navigation_profile_tap.dart';
import '../navigation_bar_taps/navigation_home_tap.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _MyWidgetState();
}

List<Widget> taps = [const HomePage(), const NavProfile()];

class _MyWidgetState extends State<CustomNavigationBar> {
  int tapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('navigation'),
      ),
      body: taps[tapIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'mic'),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarms), label: 'alaram'),
        ],
        currentIndex: tapIndex,
        onTap: (index) {
          setState(() {
            tapIndex = index;
          });
        },
      ),
    );
  }
}
