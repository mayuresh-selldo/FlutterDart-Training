import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  bool isGameEnded = false;
  String? selectedAnswer;

  List<Question> questions = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
    Question(
        q: 'Approximately one quarter of the human bones are in the feet',
        a: true),
    Question(q: 'A slug\'s blood is green', a: true),
  ];

  int questionNumber = 0;

  void checkAnswer(bool userAnswer) async {
    if (selectedAnswer == null) return;

    bool correctAnswer = questions[questionNumber].questionAnswer;

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
            size: 40.0,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
            size: 40.0,
          ),
        );
      }

      questionNumber++;
      selectedAnswer = null;

      if (questionNumber >= questions.length) {
        isGameEnded = true;
      }
    });

    if (isGameEnded) {
      await Future.delayed(Duration(seconds: 5));

      setState(() {
        questionNumber = 0;
        scoreKeeper.clear();
        isGameEnded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container()), // This pushes content down
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      isGameEnded
                          ? 'Game Over! Your Final Score: ${scoreKeeper.where((icon) => icon.icon == Icons.check).length}/${questions.length}'
                          : questions[questionNumber].questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white30),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RadioListTile<String>(
                    title: Text(
                      'I have chosen my answer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    ),
                    value: 'confident',
                    groupValue: selectedAnswer,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(bottom: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedAnswer == null
                                ? Colors.green.withOpacity(0.5)
                                : Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: selectedAnswer == null ? 0 : 4,
                          ),
                          onPressed: selectedAnswer == null || isGameEnded
                              ? null
                              : () => checkAnswer(true),
                          child: Text(
                            'True',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(bottom: 24),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: selectedAnswer == null
                                ? Colors.red.withOpacity(0.5)
                                : Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: selectedAnswer == null ? 0 : 4,
                          ),
                          onPressed: selectedAnswer == null || isGameEnded
                              ? null
                              : () => checkAnswer(false),
                          child: Text(
                            'False',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scoreKeeper,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
