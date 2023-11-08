import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  //add  SwitchScreen funtion here like startQuize arg(contain as a value).

// variable
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            //other way to add transparnt
            color: const Color.fromARGB(188, 250, 250, 250),
          ),

          //   Opacity(
          // //add transparent style
          //     opacity: 0.5,
          //     child: Image.asset(
          //       'assets/images/quiz-logo.png',
          //       width: 300,
          //     ),
          //   ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Flutter Quiz App",
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoFlex(
                fontSize: 25,
                color: const Color.fromARGB(106, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 110,
            //add icons to button .icon
            child: OutlinedButton.icon(
              onPressed: startQuiz, //as a value funtion
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 15),
                  padding: const EdgeInsets.all(15),
                  shadowColor: const Color.fromARGB(255, 255, 255, 255)),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
            ),
          )
        ],
      ),
    );
  }
}
