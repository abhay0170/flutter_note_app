import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:samsung_notes/note_model_folder/note_card.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';
import 'package:samsung_notes/screens/create_note_folder/create_note.dart';
import 'package:samsung_notes/screens/drawer_folder/drawer.dart';
import 'package:samsung_notes/screens/homepage/home_page_content/home_popup.dart';
import 'package:samsung_notes/screens/update_note_folder/updatenote.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final notes = useState<List<Note>>([]);
    final bin = useState<List<Note>>([]);
    final selectedNote =
        useState<List<bool>>(List.filled(notes.value.length, false));

    useEffect(() {
      List storedNotes = storage.read('notes') ?? [];
      List storedBin = storage.read('bin') ?? [];

      notes.value = storedNotes.map((note) => Note.fromJson(note)).toList();
      bin.value = storedBin.map((note) => Note.fromJson(note)).toList();

      return null;
    }, []);

    void selectAllNotes() {
      selectedNote.value = List.filled(notes.value.length, true);
    }

//////////////////////////////////////////////////////////////////////////////////////////

    void addNote(Note note) {
      notes.value = [...notes.value, note];
      selectedNote.value = [...selectedNote.value, false];
      storage.write('notes', notes.value.map((note) => note.toJson()).toList());
    }

    void newUpdateNote(Note updatedNote, int index) {
      notes.value[index] = updatedNote;
      storage.write('notes', notes.value.map((note) => note.toJson()).toList());
    }

/////////////////////////////////////////////////////////////////////////////////////////

    void moveToBin() {
      final newBin = <Note>[];
      final remainingNotes = <Note>[];
      final updatedSelection = <bool>[];

      for (int i = 0; i < notes.value.length; i++) {
        if (selectedNote.value[i]) {
          newBin.add(notes.value[i]);
        } else {
          remainingNotes.add(notes.value[i]);
          updatedSelection.add(false);
        }
      }

      bin.value = [...bin.value, ...newBin];
      storage.write('bin', notes.value.map((note) => note.toJson()).toList());
      notes.value = remainingNotes;
      storage.write('notes', notes.value.map((note) => note.toJson()).toList());
      selectedNote.value = updatedSelection;
    }

    void restoreNote(Note restored) {
      notes.value = [...notes.value, restored];
      // storage.write('notes', notes.value.map((note) => note.toJson()).toList());
    }

    return Scaffold(
        key: NotesDrower.drawerKey,
        drawer: NotesDrower(
          bin: bin.value,
          restoreNote: restoreNote,
        ),
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
                      HomePopup()
                    ],
                  ),
            SliverToBoxAdapter(
              child: notes.value.isEmpty
                  ? SizedBox(
                      height: 300, child: Center(child: Text("no notes")))
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
                                  style: ElevatedButton.styleFrom(
                                      shadowColor: null),
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
                                      onLongPress: () => selectAllNotes(),
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
                                          storage.write(
                                              'notes',
                                              notes.value
                                                  .map((note) => note.toJson())
                                                  .toList());
                                        } else {
                                          newUpdateNote(updatedNote, index);
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          NoteCard(
                                              note: notes.value[index],
                                              index: index),
                                          if (selectedNote.value.length >
                                                  index &&
                                              selectedNote.value[index])
                                            Positioned(
                                                top: 10,
                                                left: 10,
                                                child: Checkbox(
                                                  value:
                                                      selectedNote.value[index],
                                                  onChanged: (value) {
                                                    selectedNote.value[index] =
                                                        value ?? false;
                                                    selectedNote.value = [
                                                      ...selectedNote.value
                                                    ];
                                                  },
                                                  activeColor:
                                                      Colors.deepOrange,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ))
                                        ],
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
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
        ),
        bottomNavigationBar: selectedNote.value.contains(true)
            ? BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        moveToBin();
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.archive_outlined)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                  ],
                ),
              )
            : null);
  }
}
