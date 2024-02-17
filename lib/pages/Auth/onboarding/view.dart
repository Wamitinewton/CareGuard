import 'package:careguard/pages/Auth/onboarding/controller.dart';
import 'package:careguard/pages/Auth/onboarding/onboarding_card.dart';
import 'package:dot_indication_flutter/dot_indication_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final OnboardingController controller = Get.put(OnboardingController());
  int _currentPage = 0;
  int selectedIndex = 0;

  // int listDot = 3;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.easeInExpo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: PageView(
              allowImplicitScrolling: true,
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              physics: const BouncingScrollPhysics(),
              children: [
                OnboardingCard(
                    text: 'Next',
                    childIcon: 'iconchild1',
                    onTap: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.bounceInOut);
                    },
                    content:
                        'Advocating for child security is an imperative shared responsibility that transcends boundaries. Every child deserves a safe environment, nurturing their well-being and fostering healthy development.'),
                OnboardingCard(
                    text: 'Next',
                    childIcon: 'iconchild2',
                    onTap: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.bounceInOut);
                    },
                    content:
                        'Child security demands constant vigilance, encompassing supervision, online education, and open communication for a safe environment, fostering resilience and confidence in children.'),
                OnboardingCard(
                    text: 'Complete',
                    childIcon: 'iconchild3',
                    onTap: () {
                      // _pageController.nextPage(
                      //     duration: Duration(milliseconds: 700),
                      //     curve: Curves.bounceInOut);
                      controller.goToSignUp();
                    },
                    content:
                        'Child security is a fundamental priority, requiring vigilant supervision, educational measures for online safety, and fostering open communication. Creating a secure environment empowers children to navigate the world with confidence and resilience.')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 60),
            child: Center(
              child: DotsIndicator(
                  controller: _pageController,
                  itemCount: 3,
                  onPageSelected: (int page) {
                    _pageController.animateToPage(page,
                        duration: _kDuration, curve: _kCurve);
                  },
                  color: Colors.blue,
                  materialType: MaterialType.circle),
            ),
          )
        ],
      ),
    );
  }
}
