import 'package:flutter/cupertino.dart';
import 'package:flutter_nandor/ViewEduWorkItem.dart';

class ViewHistoryWork extends StatelessWidget {
  const ViewHistoryWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Work Experience",
            style: TextStyle(
              fontSize: 48.0, // Set your desired font size
              fontWeight: FontWeight.bold,
            ),
          ),
          ViewEduWorkItem(
            title: "Android Reverse Engineer",
            location: "Cognizant",
            description: "Lorem lorem",
          ),
          ViewEduWorkItem(
            title: "Android Engineer",
            location: "Endava",
            description: "Lorem lorem",
          ),
          ViewEduWorkItem(
            title: "Mobile Developer",
            location: "Accenture",
            description: "Lorem lorem",
          ),
        ],
      ),
    );
  }
}
