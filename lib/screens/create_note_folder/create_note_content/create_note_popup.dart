import 'package:flutter/material.dart';

class CreateNotePopup extends StatelessWidget {
  const CreateNotePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
            icon: Icon(Icons.add),
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.image,
                                color: Colors.black,
                              ),
                              Text(
                                "Image",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Row(
                        spacing: 10,
                        children: [
                          Icon(
                            Icons.picture_as_pdf_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            "PDF",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                ],
              )),
              PopupMenuDivider(),
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.mic_none),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Voice recording")
                ],
              )),
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.music_note_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Audio file"),
                ],
              )),
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.color_lens_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Drawing"),
                ],
              )),
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.check_box_outline_blank),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Text box"),
                ],
              )),
            ],
          );
  }
}
