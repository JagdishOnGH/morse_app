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
          SizedBox(height: 50),

          // Drag Target Container
          DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              print(rejectedData);
              return Container(
                width: 200,
                height: 100,
                color: candidateData.isEmpty
                    ? Colors.grey[300]
                    : Colors.green[200],
                child: Center(
                  child: Text(
                    isChipDropped ? "Chip Dropped!" : "Drop here",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
            onWillAcceptWithDetails: (data) {
              return data.data != "Hello" ? false : true;
            },
            onAcceptWithDetails: (data) {
              setState(() {
                isChipDropped = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
