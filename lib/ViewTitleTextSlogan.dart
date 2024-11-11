import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'GlobalStateProvider.dart';

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
        fontSize: Provider.of<GlobalStateProvider>(context).sizes.slogan, // Set your desired font size
        fontWeight: FontWeight.bold,
      ),
    );
  }
}