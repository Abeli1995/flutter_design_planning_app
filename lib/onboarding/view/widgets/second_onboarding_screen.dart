import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/styles/colors/theme.dart';

class SecondOnboardingScreen extends StatelessWidget {
  const SecondOnboardingScreen({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.lightPink,
      child: Column(
        children: [
          Image.asset(image),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'JosefinSans',
                color: CustomTheme.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
