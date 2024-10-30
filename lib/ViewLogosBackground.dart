import 'package:coast/coast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewLogosBackground extends StatelessWidget {
  const ViewLogosBackground({
    super.key,
    required this.svgSize,
  });

  final double svgSize;

  static const Color shade = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Crab(
        tag: "logos-bg",
        child: Container(
          height: svgSize * 3.2,
          width: svgSize * 1.1,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), // Rounded top-left corner
              bottomRight:
                  Radius.circular(20.0), // Rounded bottom-left corner
            ),
            boxShadow: [
              BoxShadow(
                color: shade,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
