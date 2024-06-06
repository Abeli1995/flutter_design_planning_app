import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/styles/colors/theme.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  const ThirdOnboardingScreen({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: CustomTheme.purple,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'JosefinSans',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
