import 'package:flutter/material.dart';
import 'package:khurapati_ideas/feature/learn/pages/learning_page.dart';

class AllLearningPage extends StatelessWidget {
  final String title;
  final LearningType type;

  const AllLearningPage({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        title: Text("$title",
            style: ts.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 10),
        child: Column(
          children: [
            Text(
              get1LineDescription(type),
              style: ts.bodySmall,
            ),
            SizedBox(height: 10),
            if (type == LearningType.Alphabet)
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.06,
                        crossAxisSpacing: 10,
                        crossAxisCount: 4),
                    itemCount: morseCodeDataAlphabet.length,
                    itemBuilder: (ctx, index) {
                      var data = morseCodeDataAlphabet[index];
                      return LetterHead(data["letter"] as String, ctx, type);
                    }),
              ),
            if (type == LearningType.Number)
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.06,
                        crossAxisSpacing: 10,
                        crossAxisCount: 4),
                    itemCount: morseCodeDataNumbers.length,
                    itemBuilder: (ctx, index) {
                      var data = morseCodeDataNumbers[index];
                      return LetterHead(data["letter"] as String, ctx, type);
                    }),
              ),
            if (type == LearningType.Symbol)
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.06,
                        crossAxisSpacing: 10,
                        crossAxisCount: 4),
                    itemCount: morseCodeDataSymbols.length,
                    itemBuilder: (ctx, index) {
                      var data = morseCodeDataSymbols[index];
                      return LetterHead(data["letter"] as String, ctx, type);
                    }),
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget LetterHead(final String title, BuildContext ctx, LearningType type) {
    final ts = Theme.of(ctx).textTheme;
    return InkWell(
      onTap: () {
        Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
          return LearningPage(letter: title, type: type);
        }));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepPurple.shade200,
        ),
        width: 80,
        height: 80,
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
