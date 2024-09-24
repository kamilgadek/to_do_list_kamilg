import 'package:flutter/material.dart';

class BottomAnimatedDialog {
  static void show(BuildContext context, {required Widget child}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
       child: child,
      ),
    );
  } 
  
}
