import 'package:flutter/material.dart';
import 'package:polydet/view/elements/simple_description_card.dart';

abstract interface class IOnBoardingSubView {

  SimpleDescriptionCard getDescription();
}

mixin OnBoardingSubviewRender {
  Widget render(Widget description, Widget submenu, String buttonDesc, VoidCallback? callback) {
    return Column(
      children: [
        description,
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  submenu
                ]
            )
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 100),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                  onPressed: callback,
                  child: Text(buttonDesc)),
            ],
          ),
        ),
      ],
    );
  }
}
