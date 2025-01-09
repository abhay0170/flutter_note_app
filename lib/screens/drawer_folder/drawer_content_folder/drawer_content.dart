import 'package:flutter/material.dart';
import 'package:samsung_notes/screens/drawer_folder/drawer_content_folder/drawer_theme.dart';

class DrawerContainer extends StatelessWidget {
  final VoidCallback destination;
  final Widget child;

  const DrawerContainer({
    super.key,
    required this.child,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding().DrawerContentPadding,
      child: GestureDetector(
        onTap: destination,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: AppPadding().DrawerContentPadding,
          child: child,
        ),
      ),
    );
  }
}
