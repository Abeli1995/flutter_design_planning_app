import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/new_room/new_room_first_screen.dart';
import 'package:flutter_design_planning_app/onboarding/view/widgets/buttons/bottom_button.dart';
import 'package:flutter_design_planning_app/onboarding/view/widgets/first_onboarding_screen.dart';
import 'package:flutter_design_planning_app/onboarding/view/widgets/second_onboarding_screen.dart';
import 'package:flutter_design_planning_app/onboarding/view/widgets/third_onboarding_screen.dart';
import 'package:flutter_design_planning_app/styles/colors/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _MyOnboardingScreenState();
}

class _MyOnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SmoothPageIndicator(
            effect: const ExpandingDotsEffect(
              dotColor: CustomTheme.primary,
              activeDotColor: CustomTheme.purple,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 5.0,
            ),
            controller: controller,
            count: 3,
            onDotClicked: (index) => controller.animateToPage(
              index,
              duration: const Duration(microseconds: 500),
              curve: Curves.easeIn,
            ),
          ),
        ),
        centerTitle: true,
      ),
      //1 add PageView and all scroll children
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: const [
          FirstOnboardingScreen(
            image: 'assets/images/first_onboarding_screen.png',
            title: 'Welcome!',
          ),
          SecondOnboardingScreen(
            image: 'assets/images/second_onboarding_screen.png',
            title:
                'We are happy to welcome you to our app, which is designed to save information about your new room design. We hope that our app will become an indispensable assistant in realizing your design ideas',
          ),
          ThirdOnboardingScreen(
            image: 'assets/images/third_onboarding_screen.png',
            title:
                'Get started now and bring your design ideas to life! We are sure that our app will become an indispensable tool for realizing your creative ideas ',
          ),
        ],
      ),
      bottomSheet: Container(
        color: CustomTheme.orange,
        padding: const EdgeInsets.only(bottom: 34),
        child: BottomButton(
          onPressed: () {
            if (currentPage == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  HomeScreen(),
                ),
              );
            } else {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          text: currentPage == 2 ? 'Start' : 'Done',
        ),
      ),
    );
  }
}
