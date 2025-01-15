import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';

class BinNoteView extends HookWidget {
  final Note bin;
  final Function(Note) onRestore;
  final Function(Note) onDelete;

  const BinNoteView({
    super.key,
    required this.bin,
    required this.onRestore,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          bin.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                onRestore(bin);
                Navigator.pop(context);
              },
              child: Text(
                "Restore",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                onDelete(bin);
                Navigator.pop(context);
              },
              child: Text("Delete",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Text(
            bin.body,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
