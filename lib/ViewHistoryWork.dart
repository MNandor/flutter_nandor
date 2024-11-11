import 'package:flutter/cupertino.dart';
import 'package:flutter_nandor/ViewEduWorkItem.dart';
import 'package:provider/provider.dart';

import 'GlobalStateProvider.dart';

class ViewHistoryWork extends StatelessWidget {
  const ViewHistoryWork({
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
            "Work Experience",
            style: TextStyle(
              fontSize: Provider.of<GlobalStateProvider>(context).sizes.slogan, // Set your desired font size
              fontWeight: FontWeight.bold,
            ),
          ),
          const ViewEduWorkItem(
            title: "Android Reverse Engineer",
            location: "Cognizant",
            description: "Lorem lorem",
          ),
          const ViewEduWorkItem(
            title: "Android Engineer",
            location: "Endava",
            description: "Lorem lorem",
          ),
          const ViewEduWorkItem(
            title: "Mobile Developer",
            location: "Accenture",
            description: "Lorem lorem",
          ),
        ],
      ),
    );
  }
}
