import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/cupertino.dart';

class Settings extends HookWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    // Using useState hook to manage the state of the settings
    final autoSaveNotes = useState(true);
    final showLinksInNotes = useState(true);
    final showWebPreviews = useState(true);
    final hideScrollBar = useState(true);
    final blockBackButton = useState(true);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("Settings", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader("General"),
          _buildSettingItem(
            context,
            title: "Style of new notes",
            icon: Icons.style,
            onTap: () {
              // Handle tap
            },
          ),
          _buildSwitchItem(
            context,
            title: "Auto save notes",
            value: autoSaveNotes.value,
            onChanged: (value) {
              autoSaveNotes.value = value;
            },
          ),
          const Divider(),
          _buildSectionHeader("Advanced"),
          _buildSwitchItem(
            context,
            title: "Show links in notes",
            value: showLinksInNotes.value,
            onChanged: (value) {
              showLinksInNotes.value = value;
            },
          ),
          _buildSwitchItem(
            context,
            title: "Show web previews",
            value: showWebPreviews.value,
            onChanged: (value) {
              showWebPreviews.value = value;
            },
          ),
          _buildSwitchItem(
            context,
            title: "Hide scroll bar when editing",
            value: hideScrollBar.value,
            onChanged: (value) {
              hideScrollBar.value = value;
            },
          ),
          _buildSwitchItem(
            context,
            title: "Block back button while editing",
            value: blockBackButton.value,
            onChanged: (value) {
              blockBackButton.value = value;
            },
          ),
          const Divider(),
          _buildSectionHeader("Privacy"),
          _buildSettingItem(
            context,
            title: "Privacy Notice",
            icon: Icons.privacy_tip,
            onTap: () {
              // Handle tap
            },
          ),
          _buildSettingItem(
            context,
            title: "About Samsung Notes",
            icon: Icons.info,
            onTap: () {
              // Handle tap
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem(BuildContext context, {required String title, required bool value, required ValueChanged<bool> onChanged}) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.black,
    );
  }
}
