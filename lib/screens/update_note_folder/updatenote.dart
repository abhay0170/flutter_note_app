import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/binned_note_model.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';

class UpdateNote extends HookWidget {
  final List<Trash> bin;
  final Note note;
  final int index;

  const UpdateNote(
      {super.key, required this.note, required this.bin, required this.index});

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
      bin.add(Trash(
          deletedTitle: updatedTitleController.text,
          deletedBody: updatedBodyController.text));
          print("title: ${bin.last.deletedTitle}, body: ${bin.last.deletedBody}");
          Navigator.pop(context,null);
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
          IconButton(
            onPressed: () {
              deleteNote();
            },
            icon: const Icon(Icons.delete),
            tooltip:
                "delete", //////////////////////////////////////////////  tap delete to move to recycle bin
          )
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
    );
  }
}
