import 'package:flutter/cupertino.dart';

class ColoredHeader extends StatelessWidget {
  final Color color;

  const ColoredHeader({
    super.key,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Row(
        children: [
          SizedBox(height: MediaQuery.paddingOf(context).top,),
        ],
      ),
    );
  }
}
