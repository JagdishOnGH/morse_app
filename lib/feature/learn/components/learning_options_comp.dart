import 'package:flutter/material.dart';

class LearningOptionsComp extends StatelessWidget {
  final int colorIndex;
  final Widget firstWidget;
  final String title;
  final VoidCallback? onTap;

  final List<MaterialColor> colors = [
    Colors.red,
    Colors.deepPurple,
    Colors.blue,
    Colors.pink,
  ];

  LearningOptionsComp(
      {super.key,
      this.colorIndex = 0,
      required this.firstWidget,
      required this.title,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: firstWidget,
            decoration: BoxDecoration(
              color: colors[1].shade500,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 130,
            height: 130,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "$title",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
