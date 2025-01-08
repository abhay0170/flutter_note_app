import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/binned_note_model.dart';
import 'package:samsung_notes/note_model_folder/recycle_card.dart';

class Recyclebin extends HookWidget {
  final List<Trash> bin;
  
  const Recyclebin({
    super.key,
    required this.bin,
  });

  @override
  Widget build(BuildContext context) {
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
                    itemCount:
                     bin.length,
                    itemBuilder: (context, index) {
                      // return;
                      return BinnedNoteCard(
                          bin: bin[index], index: index);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
