
// Recycle Bin Page
import 'package:flutter/material.dart';

class RecycleBinPage extends StatelessWidget {
  final List<String> recycleBin;

  const RecycleBinPage({super.key, required this.recycleBin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
      ),
      body: ListView.builder(
        itemCount: recycleBin.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.grey[300],
            child: ListTile(
              title: Text(recycleBin[index]),
            ),
          );
        },
      ),
    );
  }
}
