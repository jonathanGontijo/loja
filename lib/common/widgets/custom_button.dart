import 'package:flutter/material.dart';
import 'package:loja/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text ;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child:  Text(text, style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),),
      style: ElevatedButton.styleFrom(
        backgroundColor: GlobalVariables.secondaryColor,
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}