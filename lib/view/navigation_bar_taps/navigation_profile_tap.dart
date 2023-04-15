import 'package:flutter/material.dart';
import 'package:navigation/view/components/customized_edit_form_text.dart';

import '../../model/objects/user.dart';

// statefull to bring data

class NavProfile extends StatelessWidget {
  final User? user;
  const NavProfile({super.key, required this.user});

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
            child: SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      child: CircleAvatar(
                        backgroundColor: Colors.amber.shade700,
                        child:
                            const Icon(Icons.camera_alt, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomizedTextFormField(
            enabled: false,
            hintText: '${user!.name}',
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            enabled: false,
            hintText: '${user!.email}',
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            enabled: false,
            hintText: '${user!.phone}',
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            enabled: false,
            hintText: '${user!.salary}',
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            enabled: false,
            hintText: '${user!.lifeStory}',
          ),
          const SizedBox(height: 20),
          CustomizedTextFormField(
            enabled: false,
            hintText: '${user!.password}',
          ),
        ],
      ),
    );
  }
}
