import 'package:coast/coast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_nandor/PageCybersec.dart';
import 'package:flutter_nandor/PageFlutter.dart';
import 'package:flutter_nandor/PageMain.dart';
import 'package:provider/provider.dart';

import 'GlobalStateProvider.dart';
import 'PageAndroid.dart';
import 'PageFinal.dart';
import 'SiteMobile.dart';

enum Language{
  ENGLISH,
  GERMAN,
  ROMANIAN,
  SWEDISH
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (kDebugMode) {
        print("Callback");
      }
      checkScreenSizeForFontSize();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    checkScreenSizeForFontSize();
  }

  void checkScreenSizeForFontSize(){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight < 600 || screenWidth < 700){
      Provider.of<GlobalStateProvider>(context, listen: false).setFontMultiplier(true);
    } else {
      Provider.of<GlobalStateProvider>(context, listen: false).setFontMultiplier(false);
    }
    if (kDebugMode) {
      print("Screen: $screenWidth x $screenHeight");
    }
  }

  final _beaches = [
    Beach(builder: (context) => PageMain(title: "Welcome!")),
    Beach(builder: (context) => PageAndroid()),
    Beach(builder: (context) => PageCybersec()),
    Beach(builder: (context) => PageFlutter()),
    Beach(builder: (context) => PageFinal(title: "Goodbye!")),
  ];

  final _coastController = CoastController(initialPage: 0);

  Map<Language, Map<String, String>> langMaps = {
    Language.ENGLISH: {
      "Hello": "Hello"
    },
    Language.GERMAN: {
      "Hello": "Hallo"
    },
    Language.ROMANIAN: {
      "Hello": "Salut"
    },
    Language.SWEDISH: {
      "Hello": "Hej"
    },

  };

  Language chosenLanguage = Language.ENGLISH;

  void _setLanguage(Language newLang){
    setState(() {
      chosenLanguage = newLang;
    });
  }

  int currentPage = 0;
  bool reachedBottom = false;
  void _onScroll(int page){
    setState(() {
      currentPage = page;
      reachedBottom = currentPage == (_beaches.length-1);
      shouldShowAppBar = false;
    });
  }

  void _scrollDown(){
    setState(() {

      if (reachedBottom) {
        _coastController.animateTo(beach: 0);
      } else {
        _coastController.animateTo(beach: currentPage +1);
      }
    });

  }

// todo change this when ready
  bool shouldShowAppBar = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;


    final bool isWider = screenWidth > screenHeight;


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: shouldShowAppBar
          ? AppBar(
              // TRY THIS: Try changing the color here to a specific color (to
              // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
              // change color while the other colors stay the same.
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              actions: [
                IconButton(
                  icon: CountryFlag.fromLanguageCode(
                    'en',
                    shape: const Circle(),
                  ),
                  tooltip: 'English',
                  onPressed: () {
                    _setLanguage(Language.ENGLISH);
                  },
                ),
                IconButton(
                  icon: CountryFlag.fromLanguageCode(
                    'de',
                    shape: const Circle(),
                  ),
                  tooltip: 'German',
                  onPressed: () {
                    _setLanguage(Language.GERMAN);
                  },
                ),
                IconButton(
                  icon: CountryFlag.fromCountryCode(
                    'ro',
                    shape: const Circle(),
                  ),
                  tooltip: 'Romanian',
                  onPressed: () {
                    _setLanguage(Language.ROMANIAN);
                  },
                ),
                IconButton(
                  icon: CountryFlag.fromCountryCode(
                    'se',
                    shape: const Circle(),
                  ),
                  tooltip: 'Romanian',
                  onPressed: () {
                    _setLanguage(Language.SWEDISH);
                  },
                ),
              ],
            )
          : null,
      body: isWider
          ? ScrollConfiguration(
              behavior: NoMouseWheelScrollBehavior(),
              child: Listener(
                // Intercept scroll before Coast sees it
                onPointerSignal: (event) {
                  print(event);
                  if (event is PointerScrollEvent) {
                    final now = DateTime.now();

                    if (event.scrollDelta.dy > 0) {
                      // Scrolling down
                      if (currentPage < _beaches.length - 1) {
                        if (_lastScrollDown == null ||
                            now.difference(_lastScrollDown!) >
                                const Duration(milliseconds: 300)) {
                          currentPage++;
                          _coastController.animateTo(beach: currentPage);
                          _lastScrollDown = now;
                        }
                      }
                    } else if (event.scrollDelta.dy < 0) {
                      // Scrolling up
                      if (currentPage > 0) {
                        if (_lastScrollUp == null ||
                            now.difference(_lastScrollUp!) >
                                const Duration(milliseconds: 300)) {
                          currentPage--;
                          _coastController.animateTo(beach: currentPage);
                          _lastScrollUp = now;
                        }
                      }
                    }
                  }
                },
                child: Coast(
                  beaches: _beaches,
                  controller: _coastController,
                  onPageChanged: _onScroll,
                  scrollDirection: Axis.vertical,
                  observers: [
                    CrabController(),
                  ],
                ),
              ),
            )
          : SiteMobile(),
      floatingActionButton: isWider
          ? FloatingActionButton(
              onPressed: _scrollDown,
              tooltip: reachedBottom ? 'Scroll up' : 'Scroll down',
              child: Icon(reachedBottom
                  ? Icons.arrow_upward_sharp
                  : Icons.arrow_downward_sharp),
            )
          : null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  DateTime? _lastScrollUp;
  DateTime? _lastScrollDown;
}

class NoMouseWheelScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch, // still allow touch drag
        PointerDeviceKind.stylus,
      };

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // Prevent default scrolling
    return const NeverScrollableScrollPhysics();
  }
}
