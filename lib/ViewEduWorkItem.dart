import 'package:flutter/widgets.dart';

class ViewEduWorkItem extends StatelessWidget {
  final String title;
  final String location;
  final String description;

  const ViewEduWorkItem({
    super.key,
    required this.title,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32.0, // Set your desired font size
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          location,
          style: const TextStyle(
              fontSize: 32.0, // Set your desired font size
              fontStyle: FontStyle.italic),
        ),
        // todo you probably want this back eventually
        // Text(
        //   description,
        //   style: const TextStyle(fontSize: 24.0),
        // ),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }
}
