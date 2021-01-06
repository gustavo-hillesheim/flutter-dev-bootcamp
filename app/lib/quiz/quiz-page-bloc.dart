import 'dart:async';

class QuestionScore {
  final bool isCorrect;

  const QuestionScore({this.isCorrect});
}

class QuizQuestion {
  final String question;
  final bool isTrue;

  const QuizQuestion({this.question, this.isTrue});
}

class QuizPageBloc {
  // ignore: close_sinks
  final _scoreController = StreamController<List<QuestionScore>>();

  // ignore: close_sinks
  final _questionController = StreamController<QuizQuestion>();
  List<QuestionScore> _currentScore;
  QuizQuestion _currentQuestion;
  final _QuestionProvider _questionProvider = _QuestionProvider();

  Stream<List<QuestionScore>> get scoreStream => _scoreController.stream;

  Stream<QuizQuestion> get questionStream => _questionController.stream;

  QuizPageBloc() {
    _start();
  }

  void resetQuestions() {
    _questionProvider.restart();
    _questionProvider.shuffle();
    _start();
  }

  void _start() {
    _setScore([]);
    _setQuestion(_questionProvider.nextQuestion());
  }

  void answerQuestion(bool answer) {
    final questionScore =
        QuestionScore(isCorrect: _currentQuestion.isTrue == answer);
    _setScore([..._currentScore, questionScore]);
    if (_questionProvider.hasNext()) {
      _setQuestion(_questionProvider.nextQuestion());
    }
  }

  bool isLastQuestion() {
    return !_questionProvider.hasNext();
  }

  int get correctQuestionsNumber =>
      this._currentScore.where((score) => score.isCorrect).length;

  int get totalQuestionsNumber => this._questionProvider.length;

  void _setQuestion(QuizQuestion question) {
    _currentQuestion = question;
    _questionController.add(question);
  }

  void _setScore(List<QuestionScore> score) {
    _currentScore = score;
    _scoreController.add(score);
  }
}

class _QuestionProvider {
  final List<QuizQuestion> _questions = [
    QuizQuestion(
        question: 'Some cats are actually allergic to humans', isTrue: true),
    QuizQuestion(
        question: 'You can lead a cow down stairs but not up stairs.',
        isTrue: false),
    QuizQuestion(
        question: 'Approximately one quarter of human bones are in the feet.',
        isTrue: true),
    QuizQuestion(question: 'A slug\'s blood is green.', isTrue: true),
    QuizQuestion(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        isTrue: true),
    QuizQuestion(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        isTrue: true),
    QuizQuestion(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        isTrue: false),
    QuizQuestion(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        isTrue: true),
    QuizQuestion(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        isTrue: false),
    QuizQuestion(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        isTrue: true),
    QuizQuestion(
        question: 'Google was originally called \"Backrub\".', isTrue: true),
    QuizQuestion(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        isTrue: true),
    QuizQuestion(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        isTrue: true)
  ];
  int _currentQuestionIndex = 0;

  QuizQuestion nextQuestion() {
    if (!hasNext()) {
      return null;
    }
    return _questions.elementAt(_currentQuestionIndex++);
  }

  bool hasNext() {
    return _currentQuestionIndex < _questions.length;
  }

  int get length => _questions.length;

  void restart() {
    this._currentQuestionIndex = 0;
  }

  void shuffle() {
    this._questions.shuffle();
  }
}
