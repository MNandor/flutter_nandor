import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewCallToAction.dart';
import 'package:flutter_nandor/ViewNoMobile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ViewMyCuteFace.dart';

class PageFinal extends StatefulWidget {
  const PageFinal({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PageFinal> createState() => _PageFinalState();
}

class _PageFinalState extends State<PageFinal> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
          Align(
            alignment: Alignment.centerLeft,
            child: Crab(
              tag: "logos-bg",
              child: Container(
                height: 0,
                width: 0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0), // Rounded top-left corner
                    bottomRight:
                        Radius.circular(20.0), // Rounded bottom-left corner
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400, minWidth: 800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ViewCallToAction(),
                    const SizedBox(
                      width: 32,
                    ),
                    //Image.asset('assets/images/face.jpg', fit: BoxFit.contain,)
                    const ViewMyCuteFace()
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return const ViewNoMobile();
    }
  }
}
