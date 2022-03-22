import 'package:flutter/material.dart';


class TextAction extends StatelessWidget {
  final String label;
  final String actionLabel;
  final void Function() onTap;
  const TextAction({
    Key? key,
    required this.label,
    required this.actionLabel,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        TextButton(
            onPressed: onTap,
            child: Text(actionLabel)
        )
      ],
    );
  }
}
