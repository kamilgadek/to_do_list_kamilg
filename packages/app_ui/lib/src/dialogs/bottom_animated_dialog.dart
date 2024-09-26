import 'package:app_ui/src/colors/app_colors.dart';
import 'package:app_ui/src/const/app_ui_const.dart';
import 'package:app_ui/src/sizes/app_sizes.dart';
import 'package:app_ui/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomAnimatedDialog {
  static void show(BuildContext context, {required Widget child}) {
    showGeneralDialog(
      barrierLabel: 'BottomAnimatedDialog',
      barrierDismissible: true,
      barrierColor: AppTheme.barrierColor,
      transitionDuration: AppUiConst.dialogAnimationDuration,
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: AppSizes.s300,
            width: double.infinity,
            margin: const EdgeInsets.only(
              bottom: AppSizes.s20,
              left: AppSizes.s12,
              right: AppSizes.s12,
            ),
            child: child,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(40),
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
