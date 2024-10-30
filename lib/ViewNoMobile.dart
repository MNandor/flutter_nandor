import 'package:flutter/widgets.dart';

class ViewNoMobile extends StatelessWidget {
  const ViewNoMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Mobile not yet implemented.\nRotate your phone :)", style: TextStyle(fontSize: 64.0),));
  }
}