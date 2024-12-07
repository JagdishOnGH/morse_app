import 'package:flutter/material.dart';
import 'package:khurapati_ideas/feature/learn/pages/all_learning_page.dart';

import 'learning_page.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final alphaPrev = morseCodeDataAlphabet.sublist(0, 4);
    final numPrev = morseCodeDataNumbers.sublist(0, 4);
    final symPrev = morseCodeDataSymbols.sublist(0, 4);
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
                      style: ts.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800)),
                  InkWell(
                      onTap: () {
                        // goto learning page
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return AllLearningPage(
                              title: "Morse To Alphabets",
                              type: LearningType.Alphabet);
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
                children: alphaPrev
                    .map((e) => LetterHead(
                          e["letter"] as String,
                          context,
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Morse To Numbers",
                      style: ts.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800)),
                  InkWell(
                      onTap: () {
                        // goto learning page
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return AllLearningPage(
                              title: "Morse To Numbers",
                              type: LearningType.Number);
                        }));
                      },
                      child: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(height: 3),
              //small information text:
              Text(
                "Learn the numbers and their mapping to morse code. Step by step learning.",
                style: ts.bodySmall,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: numPrev
                    .map((e) => LetterHead(
                          e["letter"] as String,
                          context,
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Morse To Symbols",
                      style: ts.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800)),
                  InkWell(
                      onTap: () {
                        // goto learning page
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return AllLearningPage(
                              title: "Morse To Symbols",
                              type: LearningType.Symbol);
                        }));
                      },
                      child: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(height: 3),
              //small information text:
              Text(
                "Learn the symbols and their mapping to morse code. Step by step learning.",
                style: ts.bodySmall,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: symPrev
                    .map((e) => LetterHead(
                          e["letter"] as String,
                          context,
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Divider(),
            ],
          )),
    );
  }

  // a sqaured shape custom wid that accepts a letter and  provide big letter with fs:30 and fw:w800
  Widget LetterHead(final String title, BuildContext ctx) {
    final ts = Theme.of(ctx).textTheme;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurple.shade200,
      ),
      width: 80,
      height: 80,
      child: Center(
        child: Hero(
          tag: title,
          child: Text(
            title,
            style: ts.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
