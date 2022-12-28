import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    Key? key,
    required this.optionColor,
    required this.optionValue,
    required this.backColor,
  }) : super(key: key);
  final Color optionColor;
  final String optionValue;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 1000,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backColor,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.blue.shade100,
          //     Colors.blue,
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Center(
          child: Text(
            optionValue,
            style: TextStyle(
              color: optionColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
