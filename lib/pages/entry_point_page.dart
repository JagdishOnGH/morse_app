import 'package:flutter/material.dart';

import '../feature/learn/pages/learn_page.dart';
import 'decode_page.dart';
import 'encode_page.dart';

class EntryPointPage extends StatefulWidget {
  const EntryPointPage({super.key});

  @override
  State<EntryPointPage> createState() => _EntryPointPageState();
}

final List<Widget> screens = [
  LearnPage(),
  EncodePage(),
  DecodePage(),
  Center(child: Text('Coming soon... 4')),
];

class _EntryPointPageState extends State<EntryPointPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert Morse Code...'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: IndexedStack(
        children: screens,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Learn',
          ),
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
