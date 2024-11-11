import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'GlobalStateProvider.dart';

class ViewCallToAction extends StatelessWidget {
  const ViewCallToAction({
    super.key,
  });

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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Make your app.",
            style: TextStyle(
              fontSize: Provider.of<GlobalStateProvider>(context).sizes.slogan, // Set your desired font size
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Make it secure.",
            style: TextStyle(
              fontSize: Provider.of<GlobalStateProvider>(context).sizes.slogan, // Set your desired font size
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: _openCVLink,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40, vertical: 20),
              textStyle: TextStyle(fontSize: Provider.of<GlobalStateProvider>(context).sizes.title),
            ),
            child: const Text('Download CV'),
          ),
          InkWell(
            onTap: _openMailtoLink,
            child: Text(
              'Or email me directly...',
              style: TextStyle(
                fontSize:
                    Provider.of<GlobalStateProvider>(context).sizes.body, // You can adjust the font size as needed
                color: Colors
                    .blue, // Change color to indicate it's clickable
                decoration: TextDecoration
                    .underline, // Underline for emphasis
              ),
            ),
          ),
        ]);
  }
}


