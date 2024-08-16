

import 'questions.dart';

class QuestionList{
  List<Question> _questions=[
    Question(question: 'You can lead a cow down stairs but not up stairs', answer: false),
    Question(question: 'Approximately one quarter of human bones are in the feet', answer: true)
  ];
  int _quesTracker=0;

  void NextQuestion(){
    if(_quesTracker<_questions.length-1){
      getQuestion();
      _quesTracker++;
    }
  }

  String getQuestion(){
    return _questions[_quesTracker].question;
  }

  bool getAnswer(){
    return _questions[_quesTracker].answer;
  }
  bool Restart(){
    if(_quesTracker>=_questions.length-1){
      return true;
    }else{
      return false;
    }
  }

  void setNumber(){
    _quesTracker=0;
  }
}

