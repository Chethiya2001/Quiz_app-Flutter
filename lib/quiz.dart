import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
//store selecting answers
  List<String> selectedAnswer = [];

//with ternary operator
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    //if finished questions navigate to the result screen
    if (selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    //with ternary operator
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    // with if
    Widget screenWidget = StartScreen((switchScreen));
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    void restartQuiz() {
      setState(() {
        selectedAnswer = [];
        activeScreen = 'questions-screen';
      });
    }

    //redirect to result screen
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 13, 151, 68),
                Color.fromARGB(255, 15, 168, 155),
                Colors.lightBlue
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          //with ternary operator
          child: screenWidget,
        ),
      ),
    );
  }
}
