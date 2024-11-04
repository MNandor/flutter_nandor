import 'package:flutter/widgets.dart';

class ViewTitleTextSlogan extends StatelessWidget {
  const ViewTitleTextSlogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "I make secure Android apps.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 48.0, // Set your desired font size
        fontWeight: FontWeight.bold,
      ),
    );
  }
}