import 'package:coast/coast.dart';
import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final"

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> with SingleTickerProviderStateMixin {
  
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

    final bool isWider = screenWidth > screenHeight;


    return Column(
      children: [
        Crab(
          tag: "hero-test", 
          child: Container(
            color: isWider ? Colors.red : Colors.orange,
            width: 200,
            height: 100,
            child: const Text("Hi")
            )
          ),
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Container(
                color: _colorAnimation.value,
                width: 200,
                height: 100,
                child: const Text("Hi")
                );
            }
          )
      ],
    );
  }
}