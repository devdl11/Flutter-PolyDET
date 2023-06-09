import 'package:flutter/material.dart';
import 'package:polydet/interfaces/view/i_page_with_route.dart';
import 'package:polydet/types/secure_storage_type.dart';
import 'package:polydet/view/elements/app_pageview.dart';
import 'package:polydet/view/elements/colored_header.dart';
import 'package:polydet/view/subview/OnBoarding/oasis_login_page.dart';
import 'package:polydet/view/subview/OnBoarding/secure_storage_selection.dart';
import 'package:provider/provider.dart';

const int numberOfSubviews = 2;

class OnBoardingPage extends StatelessWidget implements IPageWithRoute {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirstSetupState(),
      child: AppPageView(
          header: ColoredHeader(color: Theme.of(context).colorScheme.primary),
          child: const OnBoardingPageComponent()),
    );
  }

  @override
  Route getRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });
  }
}

class OnBoardingPageComponent extends StatefulWidget {
  const OnBoardingPageComponent({super.key});

  @override
  State<OnBoardingPageComponent> createState() =>
      _OnBoardingPageComponentState();
}

class FirstSetupState extends ChangeNotifier {
  SecureStorageType storageType = SecureStorageType.online;

  void setStorageType(SecureStorageType s) {
    if (s == storageType) return;
    storageType = s;
    notifyListeners();
  }
}

class _OnBoardingPageComponentState extends State<OnBoardingPageComponent> {
  var _submenuIndex = 0;
  // first submenu
  late Widget submenu;

  void nextSubview() {
    _submenuIndex += 1;
    if (_submenuIndex == 1) {
      setState(() {
        submenu = OasisLoginPage(changeSubview: nextSubview,);
      });
    } else {
      throw RangeError("Invalid OnBoarding Submenu !");
    }
  }

  @override
  void initState() {
    super.initState();
    submenu = SecureStorageSelection(changeSubview: nextSubview,);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var headerTextStyle = theme.textTheme.headlineMedium!
        .merge(TextStyle(color: theme.colorScheme.onPrimary));

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        OnBoardingHeader(
          color: theme.colorScheme.primary,
          textStyle: headerTextStyle,
        ),
        Expanded(child: OnBoardingSubMenuAnimation(submenu: submenu)),
      ],
    );
  }
}

class OnBoardingSubMenuAnimation extends StatelessWidget {
  const OnBoardingSubMenuAnimation({
    super.key,
    required this.submenu,
  });

  final Widget submenu;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(seconds: 2),
        transitionBuilder: (child, animation) {
          var begin = Offset(double.negativeInfinity, Offset.zero.dy);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        child: submenu
      );
  }
}

class OnBoardingHeader extends StatelessWidget {
  final Color color;
  final TextStyle textStyle;

  const OnBoardingHeader(
      {super.key, required this.color, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints:
            const BoxConstraints(maxHeight: 200, minWidth: double.infinity),
        child: ColoredBox(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OnBoarding",
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ));
  }
}
