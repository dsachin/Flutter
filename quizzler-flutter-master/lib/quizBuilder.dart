import 'question.dart';

class QuizBuilder {
  int _questionNumber = 0;

  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: true),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: false),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: true),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: false),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: true),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: false),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];

  void nextQuestion() {
    _questionNumber < questionBank.length - 1
        ? _questionNumber++
        : _questionNumber = 0;
  }

  String getQuestion() {
    return questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return questionBank[_questionNumber].answer;
  }
}
