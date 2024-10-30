import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewNoMobile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PageAndroid extends StatefulWidget {
  const PageAndroid({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<PageAndroid> createState() => _PageAndroidState();
}

class _PageAndroidState extends State<PageAndroid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Duration for one cycle of animation
    )..repeat(reverse: true); // Repeat the animation in reverse

    // Define the color animation using ColorTween
    _colorAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.cyan,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  String appName = "ConfuseGroups";
  String appDescription = "Learning app based on multiple-choice questions, Spaced Repetition, and intelligent features based in Graph Theory.";
  void _changePage(int page, CarouselPageChangedReason reason) {
    setState(() {
      switch (page) {
        case 0:
          appName = "ConfuseGroups";
          appDescription =
              "Learning app based on multiple-choice questions, Spaced Repetition, and intelligent features based in Graph Theory.";
          break;
        case 1:
          appName = "Wout";
          appDescription =
              "Very simple workout tracking app that logs exercises, visualizes data, and motivates the user to reach their fitness goals.";
          break;
        case 2:
          appName = "AQW Guide";
          appDescription =
              "Video game guide app that advises the user on optimal builds for in-game classes.";
          break;
        case 3:
          appName = "LifeMinMaxer";
          appDescription =
              "Multi-purpose productivity app with to-do lists, project plans, shopping lists, and other features.";
          break;
        case 4:
          appName = "Voice-Inventory";
          appDescription =
              "App designed for warehouse employees. Allows user to modify inventory data using voice commands.";
          break;
        case 5:
          appName = "Shop Locator";
          appDescription =
              "Show the client's physical stores to customers using Google Maps API.";
          break;

        case 6:
          appName = "Car Chargers";
          appDescription =
              "App designed for an electric car charging company. Upon login, the user is shown nearby chargers and their availibility.";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double svgSize = 100;

    final bool isWider = screenWidth > screenHeight;

    if (isWider) {
      return Stack(
        children: [
          Center(
              child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 100.0),
                SizedBox(
                  width: 540,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "I've made...",
                        style: TextStyle(
                          fontSize: 24.0, // Set your desired font size
                        ),
                      ),
                      Text(
                        appName,
                        style: const TextStyle(
                          fontSize: 48.0, // Set your desired font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        appDescription,
                        style: TextStyle(
                          fontSize: 24.0, // Set your desired font size
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 600,
                  child: CarouselSlider(
                      options: CarouselOptions(
                        height: 800.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: true,
                        onPageChanged: _changePage,
                      ),
                      items: [
                        Image.asset(
                            "assets/images/app-screenshots/confuseGroups.png"),
                        Image.asset("assets/images/app-screenshots/wout.png"),
                        Image.asset(
                            "assets/images/app-screenshots/aqw-guide.png"),
                        Image.asset(
                            "assets/images/app-screenshots/lifeminmaxer.png"),
                        Image.asset(
                            "assets/images/app-screenshots/react-voice.png"),
                        Image.asset(
                            "assets/images/app-screenshots/betshops.png"),
                        Image.asset(
                            "assets/images/app-screenshots/electric-chargers.png"),
                      ]),
                ),
              ],
            ),
          )),
          Align(
            alignment: Alignment.centerLeft,
            child: Crab(
              tag: "logos-bg",
              child: Container(
                height: svgSize * 3.2,
                width: svgSize * 1.1,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0), // Rounded top-left corner
                    bottomRight:
                        Radius.circular(20.0), // Rounded bottom-left corner
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: svgSize,
                height: svgSize,
              ),
              Crab(
                  tag: "logo-cybersec",
                  child: SvgPicture.asset('assets/images/cybersecurity.svg',
                      width: svgSize, height: svgSize)),
              Crab(
                  tag: "logo-flutter",
                  child: SvgPicture.asset('assets/images/flutter.svg',
                      width: svgSize, height: svgSize)),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Crab(
                tag: "logo-android",
                child: SvgPicture.asset('assets/images/android.svg',
                    width: svgSize, height: svgSize)),
          ),
        ],
      );

      return Column(
        children: [
          Crab(
              tag: "hero-test",
              child: Container(
                  color: isWider ? Colors.red : Colors.orange,
                  width: 200,
                  height: 100,
                  child: const Text("Hi"))),
          AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return Container(
                    color: _colorAnimation.value,
                    width: 200,
                    height: 100,
                    child: const Text("Hi"));
              })
        ],
      );
    } else {
      return ViewNoMobile();
    }
  }
}
