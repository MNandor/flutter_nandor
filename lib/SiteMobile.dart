import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewLogosRow.dart';
import 'package:flutter_nandor/ViewMyCuteFace.dart';

class SiteMobile extends StatelessWidget {
  const SiteMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final double svgSize = 100;
    
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //ViewMyCuteFace()
          ViewLogosRow(svgSize: svgSize)
        ],
      ),
    );
  }
}
