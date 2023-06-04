import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polydet/globals.dart';
import 'package:polydet/view/assets_loader.dart';
import 'package:polydet/view/pages/splash_screen.dart';
import 'package:provider/provider.dart';

import 'interfaces/view/i_page_with_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).whenComplete(() => runApp(const PolyDETApp()));
}


class PolyDETApp extends StatelessWidget {
  const PolyDETApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PolyState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PolyDET',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF019CDD))
        ),
        home: const PageLauncher(),
        navigatorKey: GlobalVariables.navState,
      ),
    );
  }
}

class PolyState extends ChangeNotifier {
  Widget currentPage = const SplashScreen();
  bool _awaitingNotify = false;
  
  void setCurrentPage(Widget widget) {
    if (widget != currentPage) {
      currentPage = widget;
      notifyListeners();
    }
  }
  
  void notifyIfNecessary() {
    if (_awaitingNotify) notifyListeners();
  }
}

class PageLauncher extends StatelessWidget {
  const PageLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PolyState>();

    var currentPage = appState.currentPage;
    var isRoot = currentPage is IPageWithRoute;

    if (!isRoot) {
      return Scaffold(
        body: SafeArea(
          child: currentPage,
        ),
      );
    }

    Future.delayed(const Duration(milliseconds: 250), () {
      Navigator.of(context).push((currentPage as IPageWithRoute).getRoute());
    });

    return const Scaffold(
      body: SafeArea(
        child: BackgroundScreen(),
      ),
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textStyle = theme.textTheme.displayMedium;

    return Column(
      children: [
        const SizedBox(height: Constants.finalLogoHeight,),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              getMainLogo(),
              Text("PolyDET", style: textStyle,)
            ],
          )
        ),
      ],
    );
  }

}
