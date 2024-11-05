import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewLogosBackground.dart';
import 'package:flutter_nandor/ViewNoMobile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageCybersec extends StatefulWidget {
  const PageCybersec({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<PageCybersec> createState() => _PageCybersecState();
}

class _PageCybersecState extends State<PageCybersec> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    const double svgSize = 100;

    final bool isWider = screenWidth > screenHeight;

    if (isWider) {
      return Stack(
        children: [
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                const SizedBox(height: svgSize),
                const Text(
                  "The Whole Lifecycle...",
                  style: TextStyle(
                    fontSize: 48.0, // Set your desired font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "I'm an Android Developer and a Security Researcher. I'm happy to integrate into your existing team and take on additional responsibilities related to Linux sysadmin work, DevOps, Malware Analysis, and Penetration Testing.",
                  style: TextStyle(
                    fontSize: 24.0, // Set your desired font size
                  ),
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 24.0, // Set your desired font size
                        ),
                        children: [
                      TextSpan(
                          text:
                              "For previous employers, I've ususally worked in "),
                      TextSpan(
                          text: "Agile/Scrum",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ". I've organized Workshops to train junior colleagues."),
                    ])),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 24.0, // Set your desired font size
                        ),
                        children: [
                      TextSpan(
                          text: "In terms of Android development, I focus on "),
                      TextSpan(
                          text: "Jetpack Compose",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " in "),
                      TextSpan(
                          text: "Kotlin",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " with an approach based on "),
                      TextSpan(
                          text: "Clean Architecture",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " and "),
                      TextSpan(
                          text: "MVVM.",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]))
              ],
            ),
          )),
          const ViewLogosBackground(svgSize: svgSize),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Crab(
                  tag: "logo-android",
                  child: SvgPicture.asset('assets/images/android.svg',
                      width: svgSize, height: svgSize)),
              const SizedBox(
                width: svgSize,
                height: svgSize,
              ),
              Crab(
                  tag: "logo-flutter",
                  child: SvgPicture.asset('assets/images/flutter.svg',
                      width: svgSize, height: svgSize)),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Crab(
                tag: "logo-cybersec",
                child: SvgPicture.asset('assets/images/cybersecurity.svg',
                    width: svgSize, height: svgSize)),
          ),
        ],
      );
    } else {
      return const ViewNoMobile();
    }
  }
}
