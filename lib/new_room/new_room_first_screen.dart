import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_planning_app/styles/colors/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'new_room_second_screen.dart';
import '../onboarding/view/widgets/buttons/bottom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int nextPage = _controller.page?.round() ?? 0;
      if (currentPage != nextPage) {
        setState(() {
          currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.lightPink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
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
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'To continue, select the appropriate\n icon for the room.',
                  style: TextStyle(
                      fontFamily: 'JosefinSans',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 142),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 206,
                    width: double.infinity,
                    child: PageView(
                      controller: _controller,
                      children: [
                        Image.asset('assets/images/home_image_first.png'),
                        Image.asset('assets/images/home_image_second.png'),
                        Image.asset('assets/images/home_image_third.png'),
                        Image.asset('assets/images/home_image_fourth.png'),
                        Image.asset('assets/images/home_image_fifth.png'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_circle_left_rounded,
                          size: 50,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  dotColor: CustomTheme.primary,
                  activeDotColor: CustomTheme.purple,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 5.0,
                ),
                controller: _controller,
                count: 5,
                onDotClicked: (index) => _controller.animateToPage(
                  index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
              const SizedBox(height: 10),
              BottomButton(
                onPressed: () {
                  if (currentPage == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewRoomScreen(),
                      ),
                    );
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                text: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
