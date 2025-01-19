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
            builder: (context) => Center(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text("Warning"),
                content: SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: Text("Small",style: TextStyle(fontSize: 18, color: Colors.black),)),
                      TextButton(onPressed: () {}, child: Text("Medium",style: TextStyle(fontSize: 18, color: Colors.black),)),
                      TextButton(onPressed: () {}, child: Text("Big",style: TextStyle(fontSize: 18, color: Colors.black),)),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
