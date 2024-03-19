import 'package:flutter/material.dart';

class FloatingFilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;

  const FloatingFilterButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: onPressed,
      child: icon,
    );
  }
}
