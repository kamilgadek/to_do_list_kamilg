import 'package:flutter/material.dart';

class BottomAnimatedDialog {
  static void show(BuildContext context, {required Widget child}) {
    showGeneralDialog(
        barrierLabel: 'BottomAnimatedDialog',
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 500),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              child: child,
            ),
          );
        });
  }
}
