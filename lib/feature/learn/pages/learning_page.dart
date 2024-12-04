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

var morseCodeDataAlphabet = [
  {"letter": "A", "morse": ".-", "pronounced": "Di-Dah"},
  {"letter": "B", "morse": "-...", "pronounced": "Dah-Di-Di-Dit"},
  {"letter": "C", "morse": "-.-.", "pronounced": "Dah-Di-Dah-Dit"},
  {"letter": "D", "morse": "-..", "pronounced": "Dah-Di-Dit"},
  {"letter": "E", "morse": ".", "pronounced": "Dit"},
  {"letter": "F", "morse": "..-.", "pronounced": "Di-Di-Dah-Dit"},
  {"letter": "G", "morse": "--.", "pronounced": "Dah-Dah-Dit"},
  {"letter": "H", "morse": "....", "pronounced": "Di-Di-Di-Dit"},
  {"letter": "I", "morse": "..", "pronounced": "Di-Dit"},
  {"letter": "J", "morse": ".---", "pronounced": "Di-Dah-Dah-Dah"},
  {"letter": "K", "morse": "-.-", "pronounced": "Dah-Di-Dah"},
  {"letter": "L", "morse": ".-..", "pronounced": "Di-Dah-Di-Dit"},
  {"letter": "M", "morse": "--", "pronounced": "Dah-Dah"},
  {"letter": "N", "morse": "-.", "pronounced": "Dah-Dit"},
  {"letter": "O", "morse": "---", "pronounced": "Dah-Dah-Dah"},
  {"letter": "P", "morse": ".--.", "pronounced": "Di-Dah-Dah-Dit"},
  {"letter": "Q", "morse": "--.-", "pronounced": "Dah-Dah-Di-Dah"},
  {"letter": "R", "morse": ".-.", "pronounced": "Di-Dah-Dit"},
  {"letter": "S", "morse": "...", "pronounced": "Di-Di-Dit"},
  {"letter": "T", "morse": "-", "pronounced": "Dah"},
  {"letter": "U", "morse": "..-", "pronounced": "Di-Di-Dah"},
  {"letter": "V", "morse": "...-", "pronounced": "Di-Di-Di-Dah"},
  {"letter": "W", "morse": ".--", "pronounced": "Di-Dah-Dah"},
  {"letter": "X", "morse": "-..-", "pronounced": "Dah-Di-Di-Dah"},
  {"letter": "Y", "morse": "-.--", "pronounced": "Dah-Di-Dah-Dah"},
  {"letter": "Z", "morse": "--..", "pronounced": "Dah-Dah-Di-Dit"}
];
