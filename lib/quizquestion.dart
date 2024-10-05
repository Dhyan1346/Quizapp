class Quizquestion {
  const Quizquestion(this.text,this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer(){
    final shuffledList= List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

}