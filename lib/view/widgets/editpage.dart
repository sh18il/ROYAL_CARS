import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class FormFieldBuild extends StatelessWidget {
  const FormFieldBuild({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class addFormFieldW extends StatelessWidget {
  const addFormFieldW({
    super.key,
    required this.width,
    required this.keyboardType,
    required this.hintText,
    required this.controller,
    required this.gradient,
  });

  final double width;
  final TextInputType? keyboardType;
  final String hintText;

  final TextEditingController controller;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'is empty';
          } else {
            return null;
          }
        },
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: GradientOutlineInputBorder(
            gradient: gradient,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
