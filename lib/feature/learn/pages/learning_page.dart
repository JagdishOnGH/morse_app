import 'package:flutter/material.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
            ),
            child: Hero(
              tag: "alphabets",
              child: Text(
                "A",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
