import 'package:flutter/widgets.dart';

class ViewTitleTextName extends StatelessWidget {
  const ViewTitleTextName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "I'm Nándor",
      style: TextStyle(
        fontSize: 72.0, // Set your desired font size
        fontWeight: FontWeight.bold,
      ),
    );
  }
}