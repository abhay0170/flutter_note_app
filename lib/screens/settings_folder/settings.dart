import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // State hooks for toggles
    final autoSaveNotes = useState(true);
    final showLinksInNotes = useState(true);
    final showWebPreviews = useState(false);
    final hideScrollBar = useState(false);
    final blockBackButton = useState(false);
    // final customTheme = Theme.of(context).extension<CustomTheme>()!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samsung Notes Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildToggleTile(
            title: 'Auto save notes',
            value: autoSaveNotes.value,
            onChanged: (val) => autoSaveNotes.value = val,
          ),
          const Divider(),
          const Text(
            'Advanced',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildToggleTile(
            title: 'Show links in notes',
            value: showLinksInNotes.value,
            onChanged: (val) => showLinksInNotes.value = val,
          ),
          _buildToggleTile(
            title: 'Show web previews',
            value: showWebPreviews.value,
            onChanged: (val) => showWebPreviews.value = val,
          ),
          _buildToggleTile(
            title: 'Hide scroll bar when editing',
            value: hideScrollBar.value,
            onChanged: (val) => hideScrollBar.value = val,
          ),
          _buildToggleTile(
            title: 'Block Back button while editing',
            value: blockBackButton.value,
            onChanged: (val) => blockBackButton.value = val,
          ),
          const Divider(),
          const Text(
            'Privacy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('Privacy Notice'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            title: const Text('About Samsung Notes'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle navigation
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
