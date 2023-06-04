import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:polydet/interfaces/view/i_onboarding_subview.dart';
import 'package:polydet/interfaces/view/i_subview_with_description.dart';

// FIXME: How access and manipulate the state of the widget from onConfirm ?

class OasisLoginPage extends StatelessWidget implements IOnBoardingSubView, ISubViewWithDescription {
  OasisLoginPage({super.key});

  final _oasisState = GlobalKey<OasisLoginPageComponentState>();

  @override
  Widget build(BuildContext context) {
    return OasisLoginPageComponent(key: _oasisState,);
  }

  @override
  Future<bool> onConfirm() async {
    return true;
  }

  @override
  List<String> getDescription() {
    return const <String>[
      "Please enter your Oasis' credentials :"
    ];
  }
  
}

class OasisLoginPageComponent extends StatefulWidget {
  const OasisLoginPageComponent({super.key});

  @override
  State<OasisLoginPageComponent> createState() => OasisLoginPageComponentState();
}

class OasisLoginPageComponentState extends State<OasisLoginPageComponent> {
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        children: <Widget>[
          TextFormField(

          ),
        ],
      ),
    );
  }

}