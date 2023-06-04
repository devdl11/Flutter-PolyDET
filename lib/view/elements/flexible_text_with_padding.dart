import 'package:flutter/cupertino.dart';

class FlexibleTextWithPadding extends StatelessWidget {
  final String text;
  final double vertical;
  final double horizontal;

  const FlexibleTextWithPadding({super.key, required this.text, this.vertical = 0, this.horizontal = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
            child: Text(text)
          ),
        ),
      ],
    );
  }

}