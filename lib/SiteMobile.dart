import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nandor/ViewHistorySchool.dart';
import 'package:flutter_nandor/ViewHistoryWork.dart';
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //ViewMyCuteFace()
            ViewTitleTextName(),
            ViewTitleTextSlogan(),
            ViewLogosRow(svgSize: svgSize),
            SizedBox(
              width: 400,
              height: 400,
              child: Flex(direction: Axis.horizontal, children: [
                ViewMyCuteFace(),
              ]),
            ),
            ViewHistoryWork(),
            ViewHistorySchool(),
          ],
        ),
      ),
    );
  }
}
