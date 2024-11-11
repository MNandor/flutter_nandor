import 'package:flutter/cupertino.dart';
import 'package:flutter_nandor/ViewEduWorkItem.dart';
import 'package:provider/provider.dart';

import 'GlobalStateProvider.dart';

class ViewHistorySchool extends StatelessWidget {
  const ViewHistorySchool({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Education",
            style: TextStyle(
              fontSize: Provider.of<GlobalStateProvider>(context).sizes.slogan, // Set your desired font size
              fontWeight: FontWeight.bold,
            ),
          ),
          const ViewEduWorkItem(
            title: "Master's of Cybersecurity",
            location: "Babeș-Bolyai University",
            description: "Lorem lorem",
          ),
          const ViewEduWorkItem(
            title: "Cross-Platform Development",
            location: "Flutter Bootcamp",
            description: "Lorem lorem",
          ),
          const ViewEduWorkItem(
            title: "Bachelor's of Computer Science",
            location: "Sapientia EMTE",
            description: "Lorem lorem",
          ),
        ],
      ),
    );
  }
}
