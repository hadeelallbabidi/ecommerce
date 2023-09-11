import 'package:flutter/material.dart';
class PrimarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const PrimarButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
         child: Text(title)));
  }
}
