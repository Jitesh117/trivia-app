import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:trivia_app/components/genre_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 32,
            right: 32,
          ),
          child: Column(
            children: [
              // Let's Play
              Row(
                children: [
                  GradientText(
                    'Let\'s Play!',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: const [
                      Colors.red,
                      Colors.orange,
                      // Colors.pink,
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Choose a category:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // topic tiles
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    GenreTile(
                      boxColor: Colors.deepPurple,
                      boxColorshade100: Colors.deepPurple.shade100,
                      genreName: 'BOOK',
                      imagePath: 'lib/assets/book.png',
                    ),
                    GenreTile(
                      boxColor: Colors.orange,
                      boxColorshade100: Colors.orange.shade100,
                      genreName: 'SPORTS',
                      imagePath: 'lib/assets/sports.png',
                    ),
                    GenreTile(
                      boxColor: Colors.green,
                      boxColorshade100: Colors.green.shade100,
                      genreName: 'MYTHOLOGY',
                      imagePath: 'lib/assets/mythology.png',
                    ),
                    GenreTile(
                      boxColor: Colors.cyan,
                      boxColorshade100: Colors.cyan.shade100,
                      genreName: 'ART',
                      imagePath: 'lib/assets/art.png',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
