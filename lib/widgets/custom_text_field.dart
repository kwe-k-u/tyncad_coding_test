import "package:flutter/material.dart";


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscure;
  final IconData? hintIcon;
  final double? width;
  final double? height;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.obscure = false,
    this.hintIcon,
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

    return SizedBox(
      width: size.width * 0.7,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.hintIcon),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20)
          // ),
          hintText: widget.hintText
        ),
      ),
    );
  }
}
