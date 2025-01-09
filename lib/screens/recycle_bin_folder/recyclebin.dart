import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/binned_note_model.dart';
import 'package:samsung_notes/note_model_folder/recycle_card.dart';
import 'package:samsung_notes/screens/recycle_bin_folder/restore.dart';

class Recyclebin extends HookWidget {
  final List<Trash> bin;

  const Recyclebin({
    super.key,
    required this.bin,
  });

  @override
  Widget build(BuildContext context) {
    final trashNotes = useState<List<Trash>>(List.from(bin));

    void onRestore(Trash note) {
      trashNotes.value = [...trashNotes.value..remove(note)];
      // print('Restored: ${note.deletedTitle}');
    }

    void onDelete(Trash note) {
      trashNotes.value = [...trashNotes.value..remove(note)];
      // print('Deleted: ${note.deletedTitle}');
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
          SliverAppBar(
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
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              height: MediaQuery.of(context).size.height,
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                height: MediaQuery.of(context).size.height - 50,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: trashNotes.value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          final restoredNote = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Restore(
                                bin: trashNotes.value[index],
                                onRestore: onRestore,
                                onDelete: onDelete,
                              ),
                            ),
                          );

                          if (restoredNote != null) {
                            bin.removeAt(index);
                          }
                        },
                        child: BinnedNoteCard(bin: bin[index], index: index),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
