import 'package:flutter/material.dart';

class FloatingActionButtonView extends StatelessWidget {
  const FloatingActionButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
