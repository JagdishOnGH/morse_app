import 'package:flutter/material.dart';

import 'learning_page.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        title: Text("Learn Morse Code"),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Morse To Alphabets",
                      style:
                          ts.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                  InkWell(
                      onTap: () {
                        // goto learning page
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return LearningPage();
                        }));
                      },
                      child: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(height: 3),
              //small information text:
              Text(
                "Learn the alphabets and their mapping to morse code. Step by step learning.",
                style: ts.bodySmall,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LetterHead("A", context),
                  LetterHead("B", context),
                  LetterHead("C", context),
                  LetterHead("D", context),
                ],
              ),
              title: "Quizzes",
              colorIndex: 1,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
