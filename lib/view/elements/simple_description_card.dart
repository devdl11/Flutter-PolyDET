import 'package:flutter/material.dart';

import 'flexible_text_with_padding.dart';

class SimpleDescriptionCard extends StatelessWidget {
  final List<String> description;

  const SimpleDescriptionCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 2, horizontal: 4),
      child: Card(
        child: Column(
          children: [
            for (final str in description)
              FlexibleTextWithPadding(
                text: str,
                horizontal: 4,
                vertical: 5,
              ),
          ],
        ),
      ),
    );
  }

}
