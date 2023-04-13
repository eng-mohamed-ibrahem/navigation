import 'package:flutter/material.dart';
import 'package:navigation/view/components/custom_drawer.dart';
import 'package:navigation/view/navigation_bar_taps/navigation_profile_tap.dart';
import 'package:navigation/view/screens/activity.dart';




class CustomNavigationBar extends StatefulWidget {
  
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomNavigationBar> {
 

  List<Widget> taps = [const Activity(), const NavProfile()];
  int tapIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer:  const CustomDrawer(),
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
