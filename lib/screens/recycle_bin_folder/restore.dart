import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samsung_notes/note_model_folder/notemodel.dart';

class Restore extends HookWidget {
  final Note bin;
  final Function(Note) onRestore;
  final Function(Note) onDelete; // Function to handle restoration

  const Restore({
    super.key,
    required this.bin,
    required this.onRestore,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          bin.title, // Display the deleted title
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                onRestore(bin);
                Navigator.pop(context);
              },
              child: Text("Restore")),
          TextButton(
              onPressed: () {
                onDelete(bin);
                Navigator.pop(context);
              },
              child: Text("Delete"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Text(
            bin.body, // Display the deleted body
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:samsung_notes/note_model_folder/binned_note_model.dart';

// class Restore extends HookWidget {
//   final Trash bin;
//   final int index;
//   final Function(Trash) onRestore;

//   const Restore({
//     super.key,
//     required this.bin,
//     required this.index,
//     required this.onRestore,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final deletedTitleController =
//         useTextEditingController(text: bin.deletedTitle);
//     final deletedBodyController =
//         useTextEditingController(text: bin.deletedBody);

//     void restoreNote() {
//       if (deletedTitleController.text.isEmpty ||
//           deletedBodyController.text.isEmpty) {
//         Navigator.pop(context);
//         return;
//       }

//       final restoredNote = Trash(
//         deletedTitle: deletedTitleController.text,
//         deletedBody: deletedBodyController.text,
//       );

//       Navigator.pop(context, restoredNote);
//       print('Restored Note Title: ${restoredNote.deletedTitle}');
//       print('Restored Note Body: ${restoredNote.deletedBody}');
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios)),
//         title: TextField(
//           controller: deletedTitleController,
//           style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//           decoration: const InputDecoration(
//               hintText: "Title",
//               hintStyle: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold),
//               border: InputBorder.none),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               restoreNote();
//             },
//             icon: const Icon(Icons.restore),
//             tooltip:
//                 "Restore", //////////////////////////////////////////////  tap delete to move to recycle bin
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: TextField(
//           controller: deletedBodyController,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//           ),
//           maxLines: null,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:samsung_notes/note_model_folder/binned_note_model.dart';

// class Restore extends HookWidget {
//   final Trash bin;
//   final int index;
//   final Function(Trash) onRestore;

//   const Restore({
//     super.key,
//     required this.bin,
//     required this.index,
//     required this.onRestore,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final deletedTitleController =
//         useTextEditingController(text: bin.deletedTitle);
//     final deletedBodyController =
//         useTextEditingController(text: bin.deletedBody);

//     void restoreNote() {
//       if (deletedTitleController.text.isEmpty ||
//           deletedBodyController.text.isEmpty) {
//         Navigator.pop(context);
//         return;
//       }

//       final restoredNote = Trash(
//         deletedTitle: deletedTitleController.text,
//         deletedBody: deletedBodyController.text,
//       );

//       Navigator.pop(context, restoredNote);
//       print('Restored Note Title: ${restoredNote.deletedTitle}');
//       print('Restored Note Body: ${restoredNote.deletedBody}');
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios)),
//         title: Text(
//           deletedTitleController.text, // Display the deleted title
//           style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               restoreNote();
//             },
//             icon: const Icon(Icons.restore),
//             tooltip: "Restore",
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SingleChildScrollView(
//           child: Text(
//             deletedBodyController.text, // Display the deleted body
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//           ),
//         ),
//       ),
//     );
//   }
// }
