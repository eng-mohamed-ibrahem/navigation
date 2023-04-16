import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side:
            const BorderSide(width: 1, color: Color.fromRGBO(173, 173, 173, 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/humberger.jpg',
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
              const Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        color: Color.fromRGBO(173, 173, 173, 1),
                      ),
                    ),
                  ))
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('food name'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Salary'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Color.fromRGBO(173, 173, 173, 1),
                      ),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        '4.8',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        size: 15,
                        color: Color.fromRGBO(254, 213, 72, 1),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const FaIcon(Icons.alarm),
                const SizedBox(
                  width: 5,
                ),
                const Text('20-25 min'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
