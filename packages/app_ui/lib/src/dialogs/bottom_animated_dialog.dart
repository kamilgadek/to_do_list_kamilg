import 'package:app_ui/src/colors/app_colors.dart';
import 'package:app_ui/src/const/app_ui_const.dart';
import 'package:flutter/material.dart';

class BottomAnimatedDialog {
  static void show(BuildContext context, {required Widget child}) {
    showGeneralDialog(
      barrierLabel: 'BottomAnimatedDialog',
      barrierDismissible: true,
      
      transitionDuration: AppUiConst.dialogAnimationDuration,
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SingleChildScrollView(
            child: child,
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
