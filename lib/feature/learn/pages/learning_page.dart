import 'package:flutter/material.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DragAndDropDemo(),
    );
  }
}

class DragAndDropDemo extends StatefulWidget {
  @override
  _DragAndDropDemoState createState() => _DragAndDropDemoState();
}

class _DragAndDropDemoState extends State<DragAndDropDemo> {
  bool isChipDropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag and Drop Demo")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Draggable Chip
          if (!isChipDropped)
            Draggable<String>(
              data: "Chip Data",
              feedback: Material(
                child: Chip(
                  label: Text("Drag me1"),
                  backgroundColor: Colors.blue,
                ),
              ),
              childWhenDragging: Opacity(
                opacity: 0.5,
                child: Chip(
                  label: Text("Drag me"),
                  backgroundColor: Colors.blue,
                ),
              ),
              child: Chip(
                label: Text("Drag me"),
                backgroundColor: Colors.blue,
              ),
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
