import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/styles/colors/theme.dart';

class FirstOnboardingScreen extends StatelessWidget {
  const FirstOnboardingScreen({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: CustomTheme.lightPink, // BackgroundColor
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 50),
          // Title
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'JosefinSans',
                color: CustomTheme.purple,
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 67),
        ],
      ),
    );
  }
}
