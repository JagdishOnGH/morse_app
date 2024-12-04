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
          SizedBox(height: 20),
          //"Morse code of A is
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Morse Value",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple)),
                SizedBox(width: 40),
                Chip(
                  label: Text(".-",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple)),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Pronounced as",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple)),
                SizedBox(width: 40),
                Chip(
                  label: Text("Di-Dah",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple)),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),
          Divider(),
          Text("Quizzes are coming soon..."),
        ],
      ),
    );
  }
}
