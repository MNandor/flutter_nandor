import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_nandor/MySecondPage.dart';

import 'MyFirstPage.dart';

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

class _MyHomePageState extends State<MyHomePage> {

  final _beaches = [
    Beach(builder: (context) => MySecondPage(title: "Welcome!")),
    Beach(builder: (context) => MyFirstPage()),
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
         actions: [
          IconButton(
            icon: CountryFlag.fromLanguageCode('en', shape: const Circle(),),
            tooltip: 'English',
            onPressed: () {
              _setLanguage(Language.ENGLISH);
            },
          ),
          IconButton(
            icon: CountryFlag.fromLanguageCode('de', shape: const Circle(),),
            tooltip: 'German',
            onPressed: () {
              _setLanguage(Language.GERMAN);
            },
          ),
          IconButton(
            icon: CountryFlag.fromCountryCode('ro', shape: const Circle(),),
            tooltip: 'Romanian',
            onPressed: () {
              _setLanguage(Language.ROMANIAN);
            },
          ),
          IconButton(
            icon: CountryFlag.fromCountryCode('se', shape: const Circle(),),
            tooltip: 'Romanian',
            onPressed: () {
              _setLanguage(Language.SWEDISH);
            },
          ),

        ],
      ),
      body: Coast(
        beaches: _beaches,
        controller: _coastController,
        scrollDirection: Axis.vertical,
        observers: [
          CrabController(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
