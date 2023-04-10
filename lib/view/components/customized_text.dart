import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final bool tbtn;
  final String data;
  const CustomText({super.key, required this.data, required this.tbtn});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      softWrap: true,
      style: tbtn
          ? const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)
          : const TextStyle(
              color: Colors.white,
              fontSize: 15),
    );
  }
}
