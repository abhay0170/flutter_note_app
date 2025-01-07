import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:samsung_notes/note_model_folder/note_card.dart';
import 'package:samsung_notes/screens/recycle_bin_folder/binned_note_model.dart';

class Recyclebin extends HookWidget {
  const Recyclebin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final binnedNote = useState<List<Trash>>([]);

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
            title: Title(
              color: Theme.of(context).colorScheme.surface,
              child: Text("Recycle Bin"),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
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
                    itemCount: binnedNote.value.length,
                    itemBuilder: (context, index) {
                      // return NoteCard(note: binnedNote.value[index] , index: index);
                      return;
                      // NoteCard();
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
