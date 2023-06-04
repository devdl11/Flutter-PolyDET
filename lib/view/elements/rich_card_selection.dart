import 'package:flutter/material.dart';

class RichCardSelection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool isSelected;

  const RichCardSelection(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.children});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var theme = Theme.of(context);
    var themeTextStyle = theme.textTheme.headlineSmall!;
    var groupColor =
        isSelected ? theme.colorScheme.primary : theme.colorScheme.secondary;
    var textStyle = themeTextStyle
        .merge(TextStyle(fontWeight: FontWeight.bold, color: groupColor));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      color: theme.colorScheme.background,
      constraints: const BoxConstraints(maxWidth: 450),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 3, color: groupColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CardTitle(title: title, textStyle: textStyle),
            const SizedBox(height: 2),
            for (final child in children)
              CardElement(child: child),

            const SizedBox(height: 4,)
          ],
        ),
      ),
    );
  }
}

class CardElement extends StatelessWidget {
  const CardElement({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: child
    );
  }
}


class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
    required this.title,
    required this.textStyle,
  });

  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: textStyle.color!))),
        child: SizedBox(
          width: double.infinity,
          child: Text(title, style: textStyle),
        ),
      ),
    );
  }
}
