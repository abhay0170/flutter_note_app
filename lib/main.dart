import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:samsung_notes/screens/homepage/homepage.dart';
import 'package:samsung_notes/themes/home_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(SamsungNotes());
}

class SamsungNotes extends StatelessWidget {
  const SamsungNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      // darkTheme: darkMode,
      home: HomePage(),
    );
  }
}