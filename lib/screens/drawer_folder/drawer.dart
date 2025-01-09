import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/binned_note_model.dart';
import 'package:samsung_notes/screens/drawer_folder/drawer_content_folder/drawer_content.dart';
import 'package:samsung_notes/screens/drawer_folder/drawer_content_folder/drawer_theme.dart';
import 'package:samsung_notes/screens/recycle_bin_folder/recyclebin.dart';
import 'package:samsung_notes/trials_folder/trial.dart';

class NotesDrower extends HookWidget {
  static final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  final List<Trash> bin;
  // final Function(Trash) onRestore;
  // final Function(Trash) onDelete;


  const NotesDrower({
    super.key,
    required this.bin,
    // required this.onRestore,
    // required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.only(top: 10),
          children: [
            ListTile(
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            ),
            DrawerContainer(
                destination: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.library_books_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "All Notes",
                      style: drawerContent,
                    )
                  ],
                )),
            DrawerContainer(
                destination: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Shared Notes",
                      style: drawerContent,
                    )
                  ],
                )),
            DrawerContainer(
                destination: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Recyclebin(
                                bin: bin,
                                // onRestore: onRestore,
                                // onDelete: onDelete,
                              )));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Recycle Bin",
                      style: drawerContent,
                    )
                  ],
                )),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            DrawerContainer(
                destination: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DeleteNote()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.folder_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Folder",
                      style: drawerContent,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Manage Folders",
                    style: drawerContent,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
