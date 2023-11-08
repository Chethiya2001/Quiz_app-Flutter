import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  //pass data
  final List<String> chosenAnswers;

  //new method for get quiz using map -> key ,value(string and objects) = summery data
  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summery.add({
        'quiz_index': i,
        'quize': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummeryData();
    final numberofTotal = questions.length;
    //use wheare method to filter
    final numberofCorrect = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answres $numberofCorrect out of $numberofTotal questions Correctly!',
            ),
            const SizedBox(
              height: 30,
            ),
            QuizeSummery(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('Restart'),
            )
          ],
        ),
      ),
    );
  }
}
