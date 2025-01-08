
// Home Page
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/trials_folder/trial_bin.dart';

class DeleteNote extends HookWidget {



  const DeleteNote({super.key});

  @override
  Widget build(BuildContext context) {
    final items = useState<List<String>>(['Card 1', 'Card 2', 'Card 3']);
    final recycleBin = useState<List<String>>([]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Cards'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecycleBinPage(
                    recycleBin: recycleBin.value,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.value.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 5,
            child: ListTile(
              title: Text(items.value[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Move card to recycle bin
                  recycleBin.value = [...recycleBin.value, items.value[index]];
                  items.value = List.from(items.value)..removeAt(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
