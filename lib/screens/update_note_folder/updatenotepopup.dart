import 'package:flutter/material.dart';

class UpdatenotepopupMenu extends StatelessWidget {
  final Function delete;

  const UpdatenotepopupMenu({
    super.key,
    required this.delete,
  });

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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Confirm Deletion",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Are you sure you want to delete?",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  delete(); // Call the delete function
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("Delete"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.delete_outline_outlined),
            )
          ],
        ))
      ],
    );
  }
}
