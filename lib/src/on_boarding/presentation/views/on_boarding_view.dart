import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/res/colours.dart';
import 'package:tiga_belas_apps/src/on_boarding/domain/entities/page_content.dart';
import 'package:tiga_belas_apps/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:tiga_belas_apps/src/on_boarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: const [
              OnBoardingBody(pageContent: PageContent.first()),
              OnBoardingBody(pageContent: PageContent.second()),
              OnBoardingBody(pageContent: PageContent.third()),
            ],
          ),
          Align(
            alignment: const Alignment(0, .55),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                spacing: 40,
                activeDotColor: Colours.backgroundBlue,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 1),
            child: Container(
              padding: EdgeInsets.all(context.width * .1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        context.read<OnBoardingCubit>().cacheFirstTimer();
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colours.backgroundBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: context.width * .05),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colours.backgroundBlue,
                      ),
                      onPressed: () {
                        pageController.animateToPage(
                          currentPage < 2 ? currentPage + 1 : 2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
