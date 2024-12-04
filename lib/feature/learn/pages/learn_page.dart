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
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          children: [
            LearningOptionsComp(
              firstWidget: Text(
                "AB\n●-●-",
                style: ts.headlineLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w900),
              ),
              title: "Letter Mapping",
              colorIndex: 1,
            ),
            LearningOptionsComp(
              firstWidget: Text(
                "Q",
                style: ts.headlineLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w900),
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
