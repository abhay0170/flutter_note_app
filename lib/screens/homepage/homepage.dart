import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/note_card.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';
import 'package:samsung_notes/screens/create_note_folder/create_note.dart';
import 'package:samsung_notes/screens/drawer_folder/drawer.dart';
import 'package:samsung_notes/screens/update_note_folder/updatenote.dart';

// class HomePage extends HookWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final notes = useState<List<Note>>([]);
//     final bin = useState<List<Note>>([]);

//     void addNote(Note note) {
//       notes.value = [...notes.value, note];
//     }

//     void newUpdateNote(Note updatedNote, int index) {
//       notes.value[index] = updatedNote;
//     }

//     void restoreNote(Note restored) {
//       notes.value = [...notes.value, restored];
//     }

//     return Scaffold(
//       key: NotesDrower.drawerKey,
//       drawer: NotesDrower(bin: bin.value, restoreNote: restoreNote),
//       backgroundColor: Theme.of(context).colorScheme.surface,
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
//                   child: Text(
//                     "All Notes",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           notes.value.isEmpty
//               ? SliverAppBar(
//                   backgroundColor: Theme.of(context).colorScheme.surface,
//                   pinned: true,
//                   toolbarHeight: 50,
//                   title: Title(
//                     color: Theme.of(context).colorScheme.surface,
//                     child: Text("All Notes"),
//                   ),
//                   actions: [
//                     IconButton(
//                         onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
//                   ],
//                 )
//               : SliverAppBar(
//                   backgroundColor: Theme.of(context).colorScheme.surface,
//                   pinned: true,
//                   toolbarHeight: 50,
//                   title: Title(
//                     color: Theme.of(context).colorScheme.surface,
//                     child: Text("All Notes"),
//                   ),
//                   actions: [
//                     IconButton(
//                         onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
//                     IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//                     PopupMenuButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         itemBuilder: (context) => [
//                               PopupMenuItem(child: Text("Edit")),
//                               PopupMenuItem(child: Text("View")),
//                               PopupMenuItem(
//                                   child: Text("Unpin favourites from top"))
//                             ])
//                   ],
//                 ),
//           SliverToBoxAdapter(
//             child: notes.value.isEmpty
//                 ? SizedBox(height: 300, child: Center(child: Text("no notes")))
//                 : Container(
//                     color: Theme.of(context).colorScheme.surface,
//                     height: MediaQuery.of(context).size.height,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 50,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 style:
//                                     ElevatedButton.styleFrom(shadowColor: null),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.sort,
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .secondary,
//                                     ),
//                                     Text("Date created"),
//                                   ],
//                                 ),
//                               ),
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(Icons.arrow_downward)),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           color: Theme.of(context).colorScheme.surface,
//                           height: MediaQuery.of(context).size.height - 50,
//                           child: GridView.builder(
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 childAspectRatio: 0.6,
//                                 crossAxisCount: 3,
//                                 crossAxisSpacing: 10.0,
//                                 mainAxisSpacing: 10.0,
//                               ),
//                               itemCount: notes.value.length,
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () async {
//                                     final updatedNote =
//                                         await Navigator.of(context)
//                                             .push(MaterialPageRoute(
//                                       builder: (context) => UpdateNote(
//                                         note: notes.value[index],
//                                         bin: bin.value,
//                                         index: index,
//                                       ),
//                                     ));
//                                     if (updatedNote == null) {
//                                       notes.value.removeAt(index);
//                                       notes.value = [...notes.value];
//                                     } else {
//                                       newUpdateNote(updatedNote, index);
//                                     }
//                                   },
//                                   child: NoteCard(
//                                       note: notes.value[index], index: index),
//                                 );
//                               }),
//                         ),
//                       ],
//                     ),
//                   ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final note = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreateNote()),
//           );
//           if (note != null) {
//             addNote(note);
//           }
//         },
//         child: Icon(Icons.edit_document),
//       ),
//     );
//   }
// }

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = useState<List<Note>>([]);
    final bin = useState<List<Note>>([]);

    final selectedNotes =
        useState<List<bool>>(List.generate(notes.value.length, (_) => false));

    void addNote(Note note) {
      notes.value = [...notes.value, note];
      selectedNotes.value.add(false); // Add a false state for new note
    }

    void newUpdateNote(Note updatedNote, int index) {
      notes.value[index] = updatedNote;
    }

    void restoreNote(Note restored) {
      notes.value = [...notes.value, restored];
    }

    // Select all notes
    void selectAllNotes() {
      selectedNotes.value = List.generate(notes.value.length, (_) => true);
      selectedNotes.value = [...selectedNotes.value]; // Trigger a refresh
    }

    // Deselect all notes
    void deselectAllNotes() {
      selectedNotes.value = List.generate(notes.value.length, (_) => false);
      selectedNotes.value = [...selectedNotes.value]; // Trigger a refresh
    }

    // Open bottom sheet for delete action
    void openDeleteBottomSheet() {
      if (selectedNotes.value.contains(true)) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Delete selected notes
                      notes.value = notes.value
                          .where((note, [index]) => !selectedNotes.value[index])
                          .toList();
                      selectedNotes.value = List.generate(
                          notes.value.length, (_) => false); // Reset selection
                      Navigator.pop(context); // Close bottom sheet
                    },
                    child: Text("Delete Selected Notes"),
                  ),
                ],
              ),
            );
          },
        );
      }
    }

    return Scaffold(
      key: NotesDrower.drawerKey,
      drawer: NotesDrower(bin: bin.value, restoreNote: restoreNote),
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                    "All Notes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          notes.value.isEmpty
              ? SliverAppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  pinned: true,
                  toolbarHeight: 50,
                  title: Title(
                    color: Theme.of(context).colorScheme.surface,
                    child: Text("All Notes"),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
                  ],
                )
              : SliverAppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  pinned: true,
                  toolbarHeight: 50,
                  title: Title(
                    color: Theme.of(context).colorScheme.surface,
                    child: Text("All Notes"),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    PopupMenuButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        itemBuilder: (context) => [
                              PopupMenuItem(child: Text("Edit")),
                              PopupMenuItem(child: Text("View")),
                              PopupMenuItem(
                                  child: Text("Unpin favourites from top"))
                            ])
                  ],
                ),
          SliverToBoxAdapter(
            child: notes.value.isEmpty
                ? SizedBox(height: 300, child: Center(child: Text("no notes")))
                : Container(
                    color: Theme.of(context).colorScheme.surface,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style:
                                    ElevatedButton.styleFrom(shadowColor: null),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sort,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    Text("Date created"),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_downward)),
                            ],
                          ),
                        ),
                        Container(
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
                              itemCount: notes.value.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onLongPress: () {
                                    selectAllNotes(); // Select all on long press
                                  },
                                  onTap: () async {
                                    final updatedNote =
                                        await Navigator.of(context)
                                            .push(MaterialPageRoute(
                                      builder: (context) => UpdateNote(
                                        note: notes.value[index],
                                        bin: bin.value,
                                        index: index,
                                      ),
                                    ));
                                    if (updatedNote == null) {
                                      notes.value.removeAt(index);
                                      notes.value = [...notes.value];
                                    } else {
                                      newUpdateNote(updatedNote, index);
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      NoteCard(
                                          note: notes.value[index],
                                          index: index),
                                      if (selectedNotes.value[
                                          index]) // Show checkbox if selected
                                        Positioned(
                                          top: 10,
                                          left: 10, // Change from right to left
                                          child: Checkbox(
                                            value: selectedNotes.value[index],
                                            onChanged: (value) {
                                              // Update the selectedNotes state at the specified index
                                              selectedNotes.value[index] =
                                                  value ?? false;
                                              selectedNotes.value = [
                                                ...selectedNotes.value
                                              ]; // Trigger a refresh
                                            },
                                            activeColor: Colors
                                                .green, // Custom color when checked
                                            checkColor:
                                                Colors.white, // Checkmark color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: selectedNotes.value.any((note) => note)
          ? BottomAppBar(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed:
                        openDeleteBottomSheet, // Open delete bottom sheet
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: deselectAllNotes, // Deselect all notes
                  ),
                ],
              ),
            )
          : null,
      floatingActionButton: !selectedNotes.value.any((note) => note)
          ? FloatingActionButton(
              onPressed: () async {
                final note = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNote()),
                );
                if (note != null) {
                  addNote(note);
                }
              },
              child: Icon(Icons.edit_document),
            )
          : null,
    );
  }
}
