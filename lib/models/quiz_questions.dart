//create model class

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

//shuffl answres
  List<String> getShuffledAnswers() {
    //copy old list using List.of and then shuffele coped list (Chaing)
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
