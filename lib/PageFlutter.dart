import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewNoMobile.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                Column(
                  children: [
                    Text(
                      "Education",
                      style: TextStyle(
                        fontSize: 48.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Babeș-Bolyai University",
                      style: TextStyle(
                        fontSize: 32.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Hi! Lorem ipsum!", style: TextStyle(fontSize: 24.0),),
                    Text(
                      "Flutter Bootcamp",
                      style: TextStyle(
                        fontSize: 32.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sapientia EMTE",
                      style: TextStyle(
                        fontSize: 32.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Work Experience",
                      style: TextStyle(
                        fontSize: 48.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Cognizant",
                      style: TextStyle(
                        fontSize: 32.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Hi! Lorem ipsum!", style: TextStyle(fontSize: 24.0),),
                    Text(
                      "Endava",
                      style: TextStyle(
                        fontSize: 32.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Accenture",
                      style: TextStyle(
                        fontSize: 32.0, // Set your desired font size
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Crab(
              tag:"logos-bg",
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
      return ViewNoMobile();
    }
  }
}
