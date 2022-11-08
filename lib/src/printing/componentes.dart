import 'package:flutter/material.dart';

import '../logic/login.dart';

class ButtonCustom1 extends StatelessWidget {
  final String text;
  final int color;
  final double width,height;
  VoidCallback onTap;

  ButtonCustom1({
    super.key,
    required this.text,
    required this.onTap,
    this.color = 0xFF2587C9,
    this.width = 50,
    this.height = 50,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: Color(color)),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Color(color),
          ),
          onPressed: onTap,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
