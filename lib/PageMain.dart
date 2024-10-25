import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageMain extends StatefulWidget {
  const PageMain({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
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

    final double svgSize = 100;

    final bool isWider = screenWidth > screenHeight;

    if (isWider) {
      return Padding(
        padding: EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I'm Nándor",
                    style: TextStyle(
                      fontSize: 72.0, // Set your desired font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "I make secure Android apps.",
                    style: TextStyle(
                      fontSize: 48.0, // Set your desired font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Crab(
                          tag: "logo-android",
                          child: SvgPicture.asset('assets/images/android.svg',
                              width: svgSize, height: svgSize)),
                      Crab(
                          tag: "logo-cybersec",
                          child: SvgPicture.asset(
                              'assets/images/cybersecurity.svg',
                              width: svgSize,
                              height: svgSize)),
                      Crab(
                          tag: "logo-flutter",
                          child: SvgPicture.asset('assets/images/flutter.svg',
                              width: svgSize, height: svgSize)),
                    ],
                  )
                ]),
            const SizedBox(
              width: 32,
            ),
            //Image.asset('assets/images/face.jpg', fit: BoxFit.contain,)
            Expanded(
                child: Image.asset(
              'assets/images/face.jpg',
            ))
          ],
        ),
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
      return Text("Mobile not yet implemented");
    }
  }
}