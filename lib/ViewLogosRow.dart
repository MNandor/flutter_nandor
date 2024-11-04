import 'package:coast/coast.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewLogosRow extends StatelessWidget {
  const ViewLogosRow({
    super.key,
    required this.svgSize,
  });

  final double svgSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Crab(
            tag: "logo-android",
            child: SvgPicture.asset(
                'assets/images/android.svg',
                width: svgSize,
                height: svgSize)),
        Crab(
            tag: "logo-cybersec",
            child: SvgPicture.asset(
                'assets/images/cybersecurity.svg',
                width: svgSize,
                height: svgSize)),
        Crab(
            tag: "logo-flutter",
            child: SvgPicture.asset(
                'assets/images/flutter.svg',
                width: svgSize,
                height: svgSize)),
      ],
    );
  }
}


