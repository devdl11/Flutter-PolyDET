import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:polydet/interfaces/view/i_onboarding_subview.dart';
import 'package:polydet/view/elements/simple_description_card.dart';
import 'package:polydet/view/subview/OnBoarding/onboarding_subview.dart';

// FIXME: How access and manipulate the state of the widget from onConfirm ?


class OasisLoginPage extends OnBoardingSubview {
  const OasisLoginPage({super.key, required super.changeSubview});

  @override
  State<OasisLoginPage> createState() => OasisLoginPageState();

  @override
  SimpleDescriptionCard getDescription() {
    return const SimpleDescriptionCard(description: [
      "Please enter your credentials: "
    ]);
  }
}

class OasisLoginPageState extends OnBoardingSubviewState<OasisLoginPage> with OnBoardingSubviewRender {
  final formState = GlobalKey<FormState>();
  var canSubmit = true;

  Widget getBody() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return render(widget.getDescription(), getBody(), "Login", canSubmit ? () {

    } : null);
  }

}