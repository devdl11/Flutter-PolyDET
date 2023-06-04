import 'package:flutter/material.dart';
import 'package:polydet/globals.dart';
import 'package:polydet/main.dart';
import 'package:polydet/view/assets_loader.dart';
import 'package:polydet/view/pages/on_boarding.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controllerFadingIn;
  late final Animation<double> _animationFadingIn;
  late final AnimationController _controllerBlinking;
  late final Animation<double> _animationBlinking;
  var height = 250.0;
  var doBlink = false;

  void backgroundTask() async {
    Future.delayed(const Duration(seconds: 10), () {
      var context = GlobalVariables.navState.currentContext!;
      var state = Provider.of<PolyState>(context, listen: false);
      state.setCurrentPage(const OnBoardingPage());
    });
  }

  @override
  void dispose() {
    _controllerFadingIn.dispose();
    _controllerBlinking.dispose();
    super.dispose();
  }

  @override
  void initState() {
    backgroundTask();
    super.initState();
    _controllerFadingIn = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );

    _animationFadingIn = CurvedAnimation(parent: _controllerFadingIn, curve: Curves.easeInOut);
    Future.delayed(const Duration(seconds: 1), () {
      () async {
        setState(() {
          height = Constants.finalLogoHeight;
        });
        Future.delayed(const Duration(seconds: 1), () => {
          setState(() {
            doBlink = true;
          })
        });
        await _controllerFadingIn.forward(from: 0);
      }();
    });

    _controllerBlinking = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this
    );

    _animationBlinking = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controllerBlinking, curve: Curves.easeIn));
    Future.delayed(const Duration(seconds: 2), () {
        _controllerBlinking.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textStyle = theme.textTheme.displayMedium;
    return Column(
      children: [
        AnimatedSize(
          duration: const Duration(seconds: 1),
          child: SizedBox(height: height,),
        ),
        FadeTransition(
          opacity: doBlink ? _animationBlinking : _animationFadingIn,
          child: Align(
            alignment: Alignment.center,
            child: Column(
               children: [
                 getMainLogo(),
                 Text("PolyDET", style: textStyle,)
               ],
             )
          ),
        ),
      ],
    );
  }
}