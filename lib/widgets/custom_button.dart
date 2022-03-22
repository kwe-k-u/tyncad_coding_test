

import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(text)
    );
  }
}
