import 'package:flutter/cupertino.dart';
import 'package:flutter_nandor/ViewEduWorkItem.dart';

class ViewHistorySchool extends StatelessWidget {
  const ViewHistorySchool({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Education",
            style: TextStyle(
              fontSize: 48.0, // Set your desired font size
              fontWeight: FontWeight.bold,
            ),
          ),
          ViewEduWorkItem(
            title: "Master's of Cybersecurity",
            location: "Babeș-Bolyai University",
            description: "Lorem lorem",
          ),
          ViewEduWorkItem(
            title: "Cross-Platform Development",
            location: "Flutter Bootcamp",
            description: "Lorem lorem",
          ),
          ViewEduWorkItem(
            title: "Bachelor's of Computer Science",
            location: "Sapientia EMTE",
            description: "Lorem lorem",
          ),
        ],
      ),
    );
  }
}
