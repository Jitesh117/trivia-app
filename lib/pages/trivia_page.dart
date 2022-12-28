import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:trivia_app/components/option_tile.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_app/components/data.dart';
import 'package:html_unescape/html_unescape.dart';

class TriviaPage extends StatefulWidget {
  const TriviaPage({
    Key? key,
    required this.gradColor,
    required this.gradColorshade100,
    required this.imagePath,
    required this.category,
  }) : super(key: key);
  final Color gradColor;
  final Color gradColorshade100;
  final String imagePath;
  final String category;

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  String? questionData = '';
  String? answer = '';
  bool isLoading = true;
  void fetchdata() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=1&category=${widget.category}&type=boolean'));
    JsonData jsonData = JsonData.fromJson(json.decode(response.body));

    var unescape = HtmlUnescape();

    questionData = jsonData.results![0].question;
    questionData = unescape.convert(questionData!);
    answer = jsonData.results![0].correctAnswer;
    setState(() {
      isLoading = false;
    });
  }

  Color firstColor = Colors.white;
  Color secondColor = Colors.white;

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = true;
            firstColor = Colors.white;
            secondColor = Colors.white;
            fetchdata();
          });
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
              widget.gradColor,
              widget.gradColorshade100,
            ],
          ),
        ),
        child: Column(
          children: [
            // Genre photo
            Center(
              child: Image.asset(
                widget.imagePath,
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // Question
            Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      questionData!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            const SizedBox(
              height: 32,
            ),
            // options
            // option one
            GestureDetector(
              onTap: () {
                setState(() {
                  if (answer == 'False') {
                    firstColor = Colors.green;
                    secondColor = Colors.red.shade100;
                  } else {
                    firstColor = Colors.red.shade100;
                    secondColor = Colors.green;
                  }
                });
              },
              child: OptionTile(
                optionColor: widget.gradColor,
                optionValue: 'True',
                backColor: firstColor,
              ),
            ),
            // option two
            GestureDetector(
              onTap: () {
                setState(() {
                  if (answer == 'True') {
                    firstColor = Colors.green;
                    secondColor = Colors.red.shade100;
                  } else if (answer == "False") {
                    firstColor = Colors.red.shade100;
                    secondColor = Colors.green;
                  }
                });
              },
              child: OptionTile(
                optionColor: widget.gradColor,
                optionValue: 'False',
                backColor: secondColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
