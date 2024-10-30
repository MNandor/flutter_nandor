import 'package:flutter/widgets.dart';

class ViewMyCuteFace extends StatelessWidget {
  const ViewMyCuteFace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 100,
          maxWidth: 640,
          maxHeight: 640,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(64.0),
          child: Image.asset(
            'assets/images/face.jpg',
          ),
        ),
      ),
    );
  }
}