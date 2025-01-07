import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';
import 'package:samsung_notes/screens/create_note_folder/create_note_content/create_note_popup.dart';
import 'package:samsung_notes/screens/create_note_folder/create_note_content/create_note_popup_2.dart';

class CreateNote extends HookWidget {
  const CreateNote({super.key});

  @override
  Widget build(BuildContext context) {
    final titleCntroller = useTextEditingController();
    final bodyController = useTextEditingController();

    void saveNote() {
      if (titleCntroller.text.isEmpty || bodyController.text.isEmpty) {
        Navigator.pop(context);
        return;
      }
      final note = Note(
        title: titleCntroller.text,
        body: bodyController.text,
      );
      Navigator.pop(context, note);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              saveNote();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: TextField(
          controller: titleCntroller,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              border: InputBorder.none),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_book_rounded),
            tooltip: "Reading Mode",
          ),
          AddPopup(),/////////////////////////////popup for add menu ////usless
          Menupopup(),////////////////////////////pupup for menu/////////usless
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: bodyController,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          maxLines: null,
        ),
      ),
    );
  }
}