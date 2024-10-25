import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageAndroid extends StatefulWidget {
  const PageAndroid({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<PageAndroid> createState() => _PageAndroidState();
}

class _PageAndroidState extends State<PageAndroid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Duration for one cycle of animation
    )..repeat(reverse: true); // Repeat the animation in reverse

    // Define the color animation using ColorTween
    _colorAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.cyan,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double svgSize = 100;

    final bool isWider = screenWidth > screenHeight;

    if (isWider) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: svgSize * 3.2,
              width: svgSize * 1.1,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0), // Rounded top-left corner
                  bottomRight:
                      Radius.circular(20.0), // Rounded bottom-left corner
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width:svgSize, height: svgSize,
              ),
              Crab(
                  tag: "logo-cybersec",
                  child: SvgPicture.asset('assets/images/cybersecurity.svg',
                      width: svgSize, height: svgSize)),
              Crab(
                  tag: "logo-flutter",
                  child: SvgPicture.asset('assets/images/flutter.svg',
                      width: svgSize, height: svgSize)),
            ],
          ),
          Crab(
                  tag: "logo-android",
                  child: SvgPicture.asset('assets/images/android.svg',
                      width: svgSize, height: svgSize)),
        ],
      );

      return Column(
        children: [
          Crab(
              tag: "hero-test",
              child: Container(
                  color: isWider ? Colors.red : Colors.orange,
                  width: 200,
                  height: 100,
                  child: const Text("Hi"))),
          AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return Container(
                    color: _colorAnimation.value,
                    width: 200,
                    height: 100,
                    child: const Text("Hi"));
              })
        ],
      );
    } else {
      return Text("Mobile not supported!");
    }
  }
}
