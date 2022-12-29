import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:trivia_app/components/option_tile.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_app/components/data.dart';
import 'package:html_unescape/html_unescape.dart';

class TriviaPage extends StatefulWidget {
  TriviaPage({
    Key? key,
    required this.gradColor,
    required this.gradColorshade100,
    required this.imagePath,
    required this.category,
  }) : super(key: key);
  Color gradColor;
  Color gradColorshade100;
  String imagePath;
  String category;

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
  IconData firstIcon = Icons.question_mark_rounded;
  IconData secondIcon = Icons.question_mark_rounded;
  void changeColor() {
    setState(() {
      if (answer == 'False') {
        firstColor = Colors.green;
        secondColor = Colors.red;
        firstIcon = Icons.check;
        secondIcon = Icons.close_rounded;
      } else {
        firstColor = Colors.red;
        secondColor = Colors.green;
        firstIcon = Icons.close_rounded;
        secondIcon = Icons.check;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      firstColor = widget.gradColor;
      secondColor = widget.gradColor;
    });
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.arrow_right_alt,
          color: widget.gradColor,
        ),
        onPressed: () {
          setState(() {
            isLoading = true;
            firstColor = widget.gradColor;
            secondColor = widget.gradColor;
            firstIcon = Icons.question_mark_rounded;
            secondIcon = Icons.question_mark_rounded;
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
            // TODO: Streak counter
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
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Container(
                      padding: EdgeInsets.only(
                        left: 8,
                      ),
                      child: Text(
                        questionData!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
            const SizedBox(
              height: 32,
            ),
            // options
            // option one
            GestureDetector(
              onTap: () {
                changeColor();
              },
              child: OptionTile(
                optionColor: widget.gradColor,
                optionValue: 'True',
                backColor: Colors.white,
                answerColor: firstColor,
                optionIcon: firstIcon,
              ),
            ),
            // option two
            GestureDetector(
              onTap: () {
                changeColor();
              },
              child: OptionTile(
                optionColor: widget.gradColor,
                optionValue: 'False',
                backColor: Colors.white,
                answerColor: secondColor,
                optionIcon: secondIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
