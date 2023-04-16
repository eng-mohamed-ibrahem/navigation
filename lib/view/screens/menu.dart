import 'package:flutter/material.dart';

import '../components/menu_item.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          // childAspectRatio: 3 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 250,
          mainAxisExtent: 320,
        ),
        itemBuilder: (context, index) {
          return const MenuItem();
        },
        itemCount: 20,
        addRepaintBoundaries: true,
      ),
    );
  }
}
