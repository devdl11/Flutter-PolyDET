import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polydet/view/elements/rich_card_selection.dart';

class RichCardSelector extends StatefulWidget {
  final List<({String title, List<Widget> elements})> elements;
  final Function(int) onSelectionChange;

  const RichCardSelector({super.key, required this.elements, required this.onSelectionChange});

  @override
  State<RichCardSelector> createState() => _RichCardSelectorState();
}

class _RichCardSelectorState extends State<RichCardSelector> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    var mediaq = MediaQuery.of(context);

    if (mediaq.orientation == Orientation.portrait) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          for (int i = 0; i < widget.elements.length; i++)
            GestureDetector(onTap: () => {
              setState(() {
                selected = i;
                widget.onSelectionChange(i);
              })
            },
              child: RichCardSelection(
                  isSelected: i == selected,
                  title: widget.elements[i].title,
                  children: widget.elements[i].elements),
            )
        ]
      );
    } else {
      // TODO : improve the landscape view if we enable it
      return const SizedBox();
      /*return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < widget.elements.length; i++)
              GestureDetector(onTap: () => {
                setState(() {
                  selected = i;
                  widget.onSelectionChange(i);
                })
              },
                child: RichCardSelection(
                    isSelected: i == selected,
                    title: widget.elements[i].title,
                    children: widget.elements[i].elements),
              )
          ]
      );*/
    }

  }
}