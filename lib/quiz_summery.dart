import 'package:flutter/material.dart';

class QuizeSummery extends StatelessWidget {
  const QuizeSummery(this.summeryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData.map(
            (data) {
              return Row(
                children: [
                  //acsess map data with key & typecasting (pass int as String)
                  Text(((data['quiz_index'] as int) + 1).toString()),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'].toString()),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'].toString()),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
