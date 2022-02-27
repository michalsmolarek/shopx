import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/intro_controller.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var introController = Get.put(IntroController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Just shop app",
              body: "ShopX is a simple shop app made with flutter",
              image: CachedNetworkImage(
                imageUrl:
                    "https://cdn.pixabay.com/photo/2017/01/31/17/00/buy-2025564_1280.png",
                fit: BoxFit.contain,
                width: 200,
              ),
            ),
            PageViewModel(
              title: "This is introduction screen",
              body: "Nothing more...",
              image: CachedNetworkImage(
                imageUrl:
                    "https://img.freepik.com/free-vector/illustration-with-kids-talking-different-language_23-2148374371.jpg?w=1800",
                fit: BoxFit.contain,
                width: 200,
              ),
            ),
            PageViewModel(
              title: "Almost there...",
              body: "You can scroll to next page right now",
              image: CachedNetworkImage(
                imageUrl:
                    "https://cdn-icons-png.flaticon.com/512/907/907032.png?w=1800",
                fit: BoxFit.contain,
                width: 200,
              ),
            ),
            PageViewModel(
              title: "Final screen",
              body: "Okay, this is the last screen",
              image: CachedNetworkImage(
                imageUrl:
                    "https://img.freepik.com/free-vector/businessman-holding-pencil-big-complete-checklist-with-tick-marks_1150-35019.jpg?w=2000",
                fit: BoxFit.contain,
                width: 200,
              ),
              footer: ElevatedButton(
                onPressed: () {
                  introController.setOnDoneTrue();
                },
                child: const Text(
                  'Let\'s go',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
          onDone: () {
            introController.setOnDoneTrue();
          },
          showSkipButton: false,
          skipOrBackFlex: 0,
          globalBackgroundColor: Colors.white,
          nextFlex: 0,
          showBackButton: true,
          back: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
