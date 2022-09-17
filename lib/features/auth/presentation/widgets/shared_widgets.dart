import 'package:flutter/material.dart';

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool isPassword = false,
  required String hintText,
  required IconData prefixIcon,
  Widget? suffixIcon,
  String? Function(String?)? validator,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon),
    );
    
Widget defaultButton(
        {required void Function()? onPressed, required Widget widget}) =>
    MaterialButton(
      color: Colors.indigo,
      onPressed: onPressed,
      child: Center(child: widget),
    );

Future navigateAndFinish(context, Widget widget) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
