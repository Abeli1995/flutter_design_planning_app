import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/styles/colors/theme.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomTheme.purple,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans',
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
