import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewLogosRow.dart';
import 'package:flutter_nandor/ViewMyCuteFace.dart';
import 'package:flutter_nandor/ViewTitleTextName.dart';
import 'package:flutter_nandor/ViewTitleTextSlogan.dart';

class SiteMobile extends StatelessWidget {
  const SiteMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final double svgSize = 100;
    
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //ViewMyCuteFace()
          ViewTitleTextName(),
          ViewTitleTextSlogan(),
          ViewLogosRow(svgSize: svgSize),
          ViewMyCuteFace(),
        ],
      ),
    );
  }
}
