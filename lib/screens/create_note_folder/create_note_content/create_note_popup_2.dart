import 'package:flutter/material.dart';

class Menupopup extends StatelessWidget {
  const Menupopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      constraints: BoxConstraints(minWidth: 250),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.edit_document,
                    color: Colors.black,
                  ),
                  Text(
                    "Edit cover",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              )),
        ),
        PopupMenuItem(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.notes_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      "Page template",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ))),
        PopupMenuItem(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.color_lens_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      "Background colour",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ))),
        PopupMenuDivider(),
        PopupMenuItem(child: Text("Full screen")),
        PopupMenuItem(child: Text("Add to")),
        PopupMenuItem(child: Text("Tag")),
        PopupMenuItem(child: Text("Save as file")),
        PopupMenuDivider(),
        PopupMenuItem(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.star_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.delete_outline_outlined))
          ],
        ))
      ],
    );
  }
}
