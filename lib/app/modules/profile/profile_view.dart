import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 100, 
          width: 100,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(-100),
          ),
        ),
      ),
    );
  }
}
