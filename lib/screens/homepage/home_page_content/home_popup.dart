import 'package:flutter/material.dart';

class HomePopup extends StatelessWidget {
  const HomePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "edit",
          child: Text("Edit"),
        ),
        PopupMenuItem(
          value: "view",
          child: Text("View"),
        ),
        PopupMenuItem(
          value: "pin",
          child: Text("Unpin favourites from top"),
        ),
      ],
      onSelected: (value) {
        if (value == "view") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              // shape: ,
              title: Text("Warning"),
              content: Column(
                children: [
                  TextButton(onPressed: () {}, child: Text("small")),
                  TextButton(onPressed: () {}, child: Text("mediom")),
                  TextButton(onPressed: () {}, child: Text("big")),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
