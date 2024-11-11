import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/GlobalStateProvider.dart';
import 'package:provider/provider.dart';

class ViewTitleTextName extends StatelessWidget {
  const ViewTitleTextName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "I'm Nándor",
      style: TextStyle(
        fontSize: Provider.of<GlobalStateProvider>(context).sizes.title, // Set your desired font size
        fontWeight: FontWeight.bold,
      ),
    );
  }
}