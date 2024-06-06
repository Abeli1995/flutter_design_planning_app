import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/onboarding/view/widgets/buttons/bottom_button.dart';
import '../styles/colors/theme.dart';

class NewRoomThirdScreen extends StatelessWidget {
  const NewRoomThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.lightPink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_circle_left_rounded,
                      size: 30,
                      color: CustomTheme.purple,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'A new Room',
                    style: TextStyle(fontSize: 34),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 26),
              const Text(
                textAlign: TextAlign.center,
                'To continue, add the furnishings\n you want to buy.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomTheme.primary),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.add_circle,
                      size: 30,
                      color: CustomTheme.purple,
                    ),
                    Text(
                      'Add a new item',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              BottomButton(
                text: 'Save',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
