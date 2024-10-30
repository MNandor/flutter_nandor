import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

Future<void> _openCVLink() async {
  Uri _url = Uri.parse('https://mnandor.github.io/Nandor.pdf');
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> _openMailtoLink() async {
  Uri _url = Uri.parse('mailto:majlanandor@gmail.com');
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
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
              padding: EdgeInsets.all(32.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1400, minWidth: 800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Make your app.",
                            style: TextStyle(
                              fontSize: 48.0, // Set your desired font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Make it secure.",
                            style: TextStyle(
                              fontSize: 48.0, // Set your desired font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _openCVLink,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              textStyle: TextStyle(fontSize: 72),
                            ),
                            child: const Text('Download CV'),
                          ),
                          InkWell(
                            onTap: _openMailtoLink,
                            child: const Text(
                              'Or email me directly...',
                              style: TextStyle(
                                fontSize:
                                    24, // You can adjust the font size as needed
                                color: Colors
                                    .blue, // Change color to indicate it's clickable
                                decoration: TextDecoration
                                    .underline, // Underline for emphasis
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      width: 32,
                    ),
                    //Image.asset('assets/images/face.jpg', fit: BoxFit.contain,)
                    ViewMyCuteFace()
                  ],
                ),
              ),
            ),
          ),
        ],
      );

      return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '{langMaps[chosenLanguage]?["Hello"]}! The app is in this language: {chosenLanguage.name}',
            ),
            Crab(
                tag: "hero-test",
                child: Container(
                  color: Colors.green,
                  width: 200,
                  height: 100,
                  child: const Text("Hi"),
                )),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      );
    } else {
      return ViewNoMobile();
    }
  }
}


