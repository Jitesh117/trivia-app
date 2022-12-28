import 'package:flutter/material.dart';
import 'package:trivia_app/components/option_tile.dart';

class TriviaPage extends StatelessWidget {
  const TriviaPage({
    Key? key,
    required this.gradColor,
    required this.gradColorshade100,
    required this.imagePath,
  }) : super(key: key);
  final Color gradColor;
  final Color gradColorshade100;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 100,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              gradColor,
              gradColorshade100,
            ],
          ),
        ),
        child: Column(
          children: [
            // Genre photo
            Center(
              child: Image.asset(
                imagePath,
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // Question
            Text(
              'In which city of Germany is the largest port?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            // options
            // option one
            OptionTile(
              optionColor: gradColor,
            ),
            // option two
            OptionTile(
              optionColor: gradColor,
            ),
            // option three
            OptionTile(
              optionColor: gradColor,
            ),
          ],
        ),
      ),
    );
  }
}
