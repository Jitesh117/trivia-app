import 'package:flutter/material.dart';

class GenreTile extends StatelessWidget {
  const GenreTile({
    Key? key,
    required this.boxColor,
    required this.boxColorshade100,
    required this.genreName,
    required this.imagePath,
  }) : super(key: key);
  final Color boxColor;
  final Color boxColorshade100;
  final String genreName;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.only(left: 16),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              boxColorshade100,
              boxColor,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // Genre name:
          children: [
            Text(
              genreName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            // Genre image
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
