
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class CardModel {
//   final String title;
//   bool isChecked;

//   CardModel({required this.title, this.isChecked = false});
// }

// class deleteNote extends HookWidget {
//   const deleteNote({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final cards = useState([
//       CardModel(title: 'Card 1'),
//       CardModel(title: 'Card 2'),
//       CardModel(title: 'Card 3'),
//       CardModel(title: 'Card 4'),
//       CardModel(title: 'Card 5'),
//       CardModel(title: 'Card 6'), // Add more cards for demonstration
//     ]);

//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3, // Adjust the number of columns as needed
//         mainAxisSpacing: 10.0,
//         crossAxisSpacing: 10.0,
//       ),
//       itemCount: cards.value.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             title: Text(cards.value[index].title),
//             trailing: Checkbox(
//               value: cards.value[index].isChecked,
//               onChanged: (bool? value) {
//                 cards.value[index].isChecked = value!;
//                 cards.value = List.from(cards.value); // Notify listeners of changes
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }