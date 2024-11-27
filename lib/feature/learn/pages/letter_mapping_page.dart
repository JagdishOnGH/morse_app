import 'package:flutter/material.dart';

class LetterMappingPage extends StatelessWidget {
  const LetterMappingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade100,
          title: Text("Letter Mapping"),
        ),
        body: ListView(
          children: [
            Text("Letter Mapping: Module 1 (ABCD)"),
            LetterHead("A"),
          ],
        ));
  }
}

Widget LetterHead(final String title) {
  return new Text(title);
  //hello funck boys how
  //maderchid
  //djhnj
}
