import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';
import 'package:samsung_notes/note_model_folder/recycle_card.dart';
import 'package:samsung_notes/screens/recycle_bin_folder/restore.dart';

class Recyclebin extends HookWidget {
  final List<Note> bin;
  final void Function(Note) restoreNote;

  const Recyclebin({super.key, required this.bin, required this.restoreNote});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final binState = useState<List<Note>>(List.from(bin));
    final selectedNote = useState<List<bool>>([]);
    bool allNoteSelected = false;

    void selectAllNotes() {
      selectedNote.value = List.filled(bin.length, true);
    }

    void deselectAllNotes() {
      selectedNote.value = List.filled(bin.length, false);
    }

/////////////////////////////////////////////////////////////////////////////////////////

    void onDelete(Note note) {
      binState.value.remove(note);
      binState.value = List.from(binState.value);

      bin.remove(note);
      storage.write(
          'bin', binState.value.map((note) => note.toJson()).toList());
    }

    void deleteSelectedNotes() {
      binState.value.removeWhere(
          (note) => selectedNote.value[binState.value.indexOf(note)]);
      bin.removeWhere((note) => selectedNote.value[bin.indexOf(note)]);
      storage.write(
          'bin', binState.value.map((note) => note.toJson()).toList());
      selectedNote.value = List.filled(binState.value.length, false);
    }

////////////////////////////////////////////////////////////////////////////////////////

    void onRestore(Note note) {
      binState.value.remove(note);
      binState.value = List.from(binState.value);
      bin.remove(note);
      storage.write(
          'bin', binState.value.map((note) => note.toJson()).toList());
      restoreNote(note);
    }

    void restoreSelectedNotes() {
      List<Note> notesToRestore = [];

      for (int i = 0; i < selectedNote.value.length; i++) {
        if (selectedNote.value[i]) {
          Note note = binState.value[i];
          notesToRestore.add(note);
        }
      }
      for (var note in notesToRestore) {
        binState.value.remove(note);
        bin.remove(note);
        storage.write(
            'bin', binState.value.map((note) => note.toJson()).toList());
        restoreNote(note);
      }
      selectedNote.value = List.filled(binState.value.length, false);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            expandedHeight: 250.0,
            pinned: false,
            floating: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Opacity(
                  opacity: 1.0,
                  child: Text(
                    "Recycle Bin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          bin.isEmpty
              ? SliverAppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  pinned: true,
                  toolbarHeight: 50,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.menu)),
                  title: Title(
                    color: Theme.of(context).colorScheme.surface,
                    child: Text("Recycle Bin"),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
                  ],
                )
              : selectedNote.value.isEmpty
                  ? SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      pinned: true,
                      toolbarHeight: 50,
                      leading: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.menu)),
                      title: Title(
                        color: Theme.of(context).colorScheme.surface,
                        child: Text("Recycle Bin"),
                      ),
                      actions: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert_rounded)),
                      ],
                    )
                  : SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      pinned: true,
                      toolbarHeight: 50,
                      leading: Checkbox(
                        value: allNoteSelected,
                        onChanged: (onoff) {
                          if (onoff == true) {
                            selectAllNotes();
                            allNoteSelected == onoff;
                          }
                          deselectAllNotes();
                        },
                        activeColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      title: Title(
                        color: Theme.of(context).colorScheme.surface,
                        child: Text("Recycle Bin"),
                      ),
                      actions: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert_rounded)),
                      ],
                    ),
          SliverToBoxAdapter(
            child: binState.value.isEmpty
                ? Container(
                    color: Theme.of(context).colorScheme.surface,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 300),
                      child: Center(child: Text("No trashes")),
                    ))
                : Container(
                    color: Theme.of(context).colorScheme.surface,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.6,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: bin.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () => selectAllNotes(),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BinNoteView(
                                  bin: bin[index],
                                  onDelete: onDelete,
                                  onRestore: onRestore,
                                ),
                              )),
                          child: Stack(
                            children: [
                              BinnedNoteCard(
                                  bin: binState.value[index], index: index),
                              if (selectedNote.value.length > index &&
                                  selectedNote.value[index])
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Checkbox(
                                    value: selectedNote.value[index],
                                    onChanged: (value) {
                                      selectedNote.value[index] =
                                          value ?? false;
                                      selectedNote.value =
                                          List.from(selectedNote.value);
                                    },
                                    activeColor: Colors.deepOrange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: selectedNote.value.contains(true)
          ? BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.restore,
                    color: Colors.black,
                  ),
                  label: 'Restore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  label: 'Delete',
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  restoreSelectedNotes();
                } else if (index == 1) {
                  deleteSelectedNotes();
                }
              },
            )
          : null,
    );
  }
}
