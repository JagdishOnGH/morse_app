import 'package:flutter/material.dart';

import 'chat_ui.dart';
import 'chat_ui_from_morse.dart';

class EntryPointPage extends StatefulWidget {
  const EntryPointPage({super.key});

  @override
  State<EntryPointPage> createState() => _EntryPointPageState();
}

final List<Widget> screens = [
  ChatUI(),
  ChatUIFromMorse(),
];

class _EntryPointPageState extends State<EntryPointPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert Morse Code...'),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Encode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code_off),
            label: 'Decode',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
