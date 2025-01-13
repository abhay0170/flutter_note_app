import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';
import 'package:samsung_notes/note_model_folder/recycle_card.dart';
import 'package:samsung_notes/screens/recycle_bin_folder/restore.dart';

class Recyclebin extends HookWidget {
  final List<Note> bin;
  final void Function(Note) restoreNote;

  const Recyclebin({super.key, required this.bin, required this.restoreNote});

  @override
  Widget build(BuildContext context) {
    final trashNotes = useState<List<Note>>(List.from(bin));

    void onRestore(Note note) {
      trashNotes.value = [...trashNotes.value..remove(note)];
      bin.remove(note);
      restoreNote(note);
    }

    void onDelete(Note note) {
      trashNotes.value = [...trashNotes.value..remove(note)];
      bin.remove(note);
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
          trashNotes.value.isEmpty
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
              : SliverAppBar(
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
                        onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
                  ],
                ),
          SliverToBoxAdapter(
            child: trashNotes.value.isEmpty
                ? Container(
                    color: Theme.of(context).colorScheme.surface,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 300),
                      child: Center(child: Text("no trashes")),
                    ))
                : Container(
                    color: Theme.of(context).colorScheme.surface,
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      height: MediaQuery.of(context).size.height - 50,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.6,
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: trashNotes.value.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () async {
                                final restoredNote =
                                    await Navigator.of(context).push(
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
                              onDoubleTap: () => Checkbox(
                                value: true,
                                onChanged: (value) => true,
                              ),
                              child:
                                  BinnedNoteCard(bin: bin[index], index: index),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:samsung_notes/note_model_folder/notemodel.dart';
// import 'package:samsung_notes/note_model_folder/recycle_card.dart';

// class Recyclebin extends HookWidget {
//   final List<Note> bin;
//   final void Function(Note) restoreNote;

//   const Recyclebin({super.key, required this.bin, required this.restoreNote});

//   @override
//   Widget build(BuildContext context) {
//     final trashNotes = useState<List<Note>>(List.from(bin));
//     final selectedNotes = useState<Set<int>>({});
//     final isSelectionMode = useState<bool>(false);

//     void toggleSelection(int index) {
//       if (selectedNotes.value.contains(index)) {
//         selectedNotes.value = {...selectedNotes.value}..remove(index);
//       } else {
//         selectedNotes.value = {...selectedNotes.value}..add(index);
//       }
//     }

//     void exitSelectionMode() {
//       isSelectionMode.value = false;
//       selectedNotes.value.clear();
//     }

//     void restoreSelectedNotes() {
//       final notesToRestore =
//           selectedNotes.value.map((index) => trashNotes.value[index]).toList();
//       for (var note in notesToRestore) {
//         restoreNote(note);
//         // Add the note back to the bin after restoring
//         bin.add(note);
//       }
//       trashNotes.value = trashNotes.value
//           .where((note) => !notesToRestore.contains(note))
//           .toList();
//       selectedNotes.value.clear();
//       isSelectionMode.value = false;
//     }

//     void deleteSelectedNotes() {
//       final notesToDelete =
//           selectedNotes.value.map((index) => trashNotes.value[index]).toList();
//       for (var note in notesToDelete) {
//         bin.remove(note); // Make sure it's removed from the bin as well
//       }
//       trashNotes.value = trashNotes.value
//           .where((note) => !notesToDelete.contains(note))
//           .toList();
//       selectedNotes.value.clear();
//       isSelectionMode.value = false;
//     }

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Theme.of(context).colorScheme.surface,
//             expandedHeight: 250.0,
//             pinned: false,
//             floating: true,
//             automaticallyImplyLeading: false,
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: true,
//               title: Padding(
//                 padding: const EdgeInsets.only(bottom: 50),
//                 child: Opacity(
//                   opacity: 1.0,
//                   child: isSelectionMode.value
//                       ? Text(
//                           "${selectedNotes.value.length} Selected",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )
//                       : Text(
//                           "Recycle Bin",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                 ),
//               ),
//             ),
//           ),
//           SliverAppBar(
//             backgroundColor: Theme.of(context).colorScheme.surface,
//             pinned: true,
//             toolbarHeight: 50,
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(Icons.menu)),
//             title: Title(
//               color: Theme.of(context).colorScheme.surface,
//               child: isSelectionMode.value
//                   ? Text("${selectedNotes.value.length} note selected")
//                   : Text("recycle bin"),
//             ),
//             actions: [
//               IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: trashNotes.value.isEmpty
//                 ? Container(
//                     color: Theme.of(context).colorScheme.surface,
//                     height: MediaQuery.of(context).size.height,
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 300),
//                       child: Center(child: Text("No trashes")),
//                     ),
//                   )
//                 : Container(
//                     color: Theme.of(context).colorScheme.surface,
//                     height: MediaQuery.of(context).size.height - 50,
//                     child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         childAspectRatio: 0.6,
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 10.0,
//                         mainAxisSpacing: 10.0,
//                       ),
//                       itemCount: trashNotes.value.length,
//                       itemBuilder: (context, index) {
//                         final isSelected = selectedNotes.value.contains(index);
//                         return GestureDetector(
//                           onLongPress: () {
//                             isSelectionMode.value = true;
//                             toggleSelection(index);
//                           },
//                           onTap: () {
//                             if (isSelectionMode.value) {
//                               toggleSelection(index);
//                               if (selectedNotes.value.isEmpty) {
//                                 exitSelectionMode();
//                               }
//                             }
//                           },
//                           child: Stack(
//                             children: [
//                               BinnedNoteCard(
//                                   bin: trashNotes.value[index], index: index),
//                               if (isSelectionMode.value)
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Checkbox(
//                                     value: isSelected,
//                                     onChanged: (value) {
//                                       toggleSelection(index);
//                                       if (selectedNotes.value.isEmpty) {
//                                         exitSelectionMode();
//                                       }
//                                     },
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: isSelectionMode.value
//           ? BottomNavigationBar(
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.restore),
//                   label: 'Restore',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.delete),
//                   label: 'Delete',
//                 ),
//               ],
//               onTap: (index) {
//                 if (index == 0) {
//                   restoreSelectedNotes();
//                 } else if (index == 1) {
//                   deleteSelectedNotes();
//                 }
//               },
//             )
//           : null,
//     );
//   }
// }