import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DeleteNote extends HookWidget {
  const DeleteNote({super.key});

  @override
  Widget build(BuildContext context) {
    final items = useState<List<String>>(['Card 1', 'Card 2', 'Card 3']);
    final recycleBin = useState<List<String>>([]);

    void restoreItem(String item) {
      items.value = [...items.value, item];
      recycleBin.value = List.from(recycleBin.value)..remove(item);
    }

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
                    onRestore: restoreItem,
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

// Recycle Bin Page
class RecycleBinPage extends HookWidget {
  final List<String> recycleBin;
  final Function(String) onRestore;

  const RecycleBinPage({
    super.key,
    required this.recycleBin,
    required this.onRestore,
  });

  @override
  Widget build(BuildContext context) {
    // Use useState to manage the local copy of recycleBin
    final localRecycleBin = useState<List<String>>(List.from(recycleBin));

    void restoreItem(String item) {
      localRecycleBin.value = List.from(localRecycleBin.value)..remove(item);
      onRestore(item);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
      ),
      body: ListView.builder(
        itemCount: localRecycleBin.value.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.grey[300],
            child: ListTile(
              title: Text(localRecycleBin.value[index]),
              trailing: IconButton(
                icon: const Icon(Icons.restore, color: Colors.green),
                onPressed: () {
                  restoreItem(localRecycleBin.value[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
