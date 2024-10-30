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
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Education",
                        style: TextStyle(
                          fontSize: 48.0, // Set your desired font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      EduWorkItem(
                        title: "Master's of Cybersecurity",
                        location: "Babeș-Bolyai University",
                        description: "Lorem lorem",
                      ),
                      EduWorkItem(
                        title: "Cross-Platform Development",
                        location: "Flutter Bootcamp",
                        description: "Lorem lorem",
                      ),
                      EduWorkItem(
                        title: "Bachelor's of Computer Science",
                        location: "Sapientia EMTE",
                        description: "Lorem lorem",
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Work Experience",
                        style: TextStyle(
                          fontSize: 48.0, // Set your desired font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      EduWorkItem(
                        title: "Android Reverse Engineer",
                        location: "Cognizant",
                        description: "Lorem lorem",
                      ),
                      EduWorkItem(
                        title: "Android Engineer",
                        location: "Endava",
                        description: "Lorem lorem",
                      ),
                      EduWorkItem(
                        title: "Mobile Developer",
                        location: "Accenture",
                        description: "Lorem lorem",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

class EduWorkItem extends StatelessWidget {
  final String title;
  final String location;
  final String description;

  const EduWorkItem({
    super.key,
    required this.title,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32.0, // Set your desired font size
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          location,
          style: const TextStyle(
              fontSize: 32.0, // Set your desired font size
              fontStyle: FontStyle.italic),
        ),
        // todo you probably want this back eventually
        // Text(
        //   description,
        //   style: const TextStyle(fontSize: 24.0),
        // ),
        SizedBox(
          height: 32,
        )
      ],
    );
  }
}
