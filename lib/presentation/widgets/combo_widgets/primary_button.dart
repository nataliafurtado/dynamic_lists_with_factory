import 'package:dynamic_lists_with_factory/utils/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonColor,
    required this.text,
  }) : super(key: key);
  final Color buttonColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: space),
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
            buttonColor,
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
