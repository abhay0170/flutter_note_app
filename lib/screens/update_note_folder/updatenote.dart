import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';
import 'package:samsung_notes/screens/create_note_folder/create_note_content/bottom_navigation.dart';
import 'package:samsung_notes/screens/update_note_folder/updatenotepopup.dart';

class UpdateNote extends HookWidget {
  final List<Note> bin;
  final Note note;
  final int index;

  const UpdateNote({
    super.key,
    required this.bin,
    required this.note,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final updatedTitleController = useTextEditingController(text: note.title);
    final updatedBodyController = useTextEditingController(text: note.body);

    void updateNote() {
      if (updatedTitleController.text.isEmpty ||
          updatedBodyController.text.isEmpty) {
        Navigator.pop(context);
        return;
      }
      final updatedNote = Note(
        title: updatedTitleController.text,
        body: updatedBodyController.text,
      );
      Navigator.pop(context, updatedNote);
    }

    void deleteNote() {
      bin.add(Note(
          title: updatedTitleController.text,
          body: updatedBodyController.text));
      Navigator.pop(context, null);
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                updateNote();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: TextField(
            controller: updatedTitleController,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
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
              icon: const Icon(Icons.edit),
              tooltip: "Edit",
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              tooltip: "Search",
            ),
            UpdatenotepopupMenu(
              delete: deleteNote,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: updatedBodyController,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            maxLines: null,
          ),
        ),
        bottomNavigationBar: NoteBottomNavigation(),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.only(bottom: 15),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       IconButton(
        //           onPressed: () {
        //             showDialog(
        //               context: context,
        //               builder: (context) => AlertDialog(backgroundColor: Colors.amber,)
        //             );
        //           },
        //           icon: Icon(Icons.draw)),
        //       IconButton(
        //           onPressed: () {}, icon: Icon(Icons.check_box_outlined)),
        //       IconButton(onPressed: () {}, icon: Icon(Icons.text_fields)),
        //       IconButton(onPressed: () {}, icon: Icon(Icons.format_color_text)),
        //       IconButton(
        //           onPressed: () {}, icon: Icon(Icons.format_paint_outlined)),
        //       IconButton(
        //           onPressed: () {},
        //           icon: Icon(Icons
        //               .add)), /////////////dropdownbuttion ////arrowdropdown
        //       IconButton(onPressed: () {}, icon: Icon(Icons.undo_rounded)),
        //       IconButton(onPressed: () {}, icon: Icon(Icons.redo_rounded)),
        //     ],
        //   ),
        // )
        );
  }
}
