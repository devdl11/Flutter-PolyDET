import 'package:flutter/material.dart';

class AppPageView extends StatelessWidget {
  const AppPageView({super.key, this.header, required this.child});
  final Widget? header;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // area before the safe zone
            if (header != null)
              header!,
            Expanded(
              child: SafeArea(
                top: header == null,
                child: child,
              ),
            ),
          ],
        ),
      )
    );
  }

}