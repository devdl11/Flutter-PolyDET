import 'package:flutter/cupertino.dart';
import 'package:polydet/interfaces/view/i_onboarding_subview.dart';

abstract class OnBoardingSubview extends StatefulWidget implements IOnBoardingSubView {
  final VoidCallback changeSubview;
  
  const OnBoardingSubview({super.key, required this.changeSubview});

}

abstract class OnBoardingSubviewState<T extends OnBoardingSubview> extends State<T> {

  @override
  Widget build(BuildContext context) {
    return const Text("unimplemented");
  }
  
}