import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewLogosBackground.dart';
import 'package:flutter_nandor/ViewNoMobile.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ViewEduWorkItem.dart';
import 'ViewHistorySchool.dart';
import 'ViewHistoryWork.dart';

class PageFlutter extends StatefulWidget {
  const PageFlutter({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<PageFlutter> createState() => _PageFlutterState();
}

class _PageFlutterState extends State<PageFlutter> {
  @override
  void initState() {
    super.initState();
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
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ViewHistorySchool(),
                ViewHistoryWork(),
              ],
            ),
          ),
          ViewLogosBackground(svgSize: svgSize),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Crab(
                  tag: "logo-android",
                  child: SvgPicture.asset('assets/images/android.svg',
                      width: svgSize, height: svgSize)),
              Crab(
                  tag: "logo-cybersec",
                  child: SvgPicture.asset('assets/images/cybersecurity.svg',
                      width: svgSize, height: svgSize)),
              SizedBox(
                width: svgSize,
                height: svgSize,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Crab(
                tag: "logo-flutter",
                child: SvgPicture.asset('assets/images/flutter.svg',
                    width: svgSize, height: svgSize)),
          ),
        ],
      );
    } else {
      return const ViewNoMobile();
    }
  }
}
