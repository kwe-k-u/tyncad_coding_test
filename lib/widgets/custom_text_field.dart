import "package:flutter/material.dart";


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscure;
  final double? width;
  final double? height;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.obscure = false,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(8),
      width: widget.width ?? size.width * 0.7,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          hintText: widget.hintText
        ),
      ),
    );
  }
}
