import 'dart:ui';
import 'mainQues.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Quiz(),
  )
);

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<Icon> icon=[];
  QuestionList questions=QuestionList();

void CorrectAns(bool ans){
  if(questions.Restart()){
    Alert(context: context, title: "Finsihed", desc: "You answered all questions").show();
    questions.setNumber();
    icon=[];
  }else{
    if(questions.getAnswer()==ans){
      questions.Restart();
      questions.NextQuestion();
      icon.add(Icon(Icons.check,color: Colors.green,));
    }else{
      questions.Restart();
      questions.NextQuestion();
      icon.add(Icon(Icons.clear,color: Colors.red,));
    }

  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(

                    questions.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                flex: 5,
              ),
              Container(
                height: 70.0,
                color: Colors.green,
                margin: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () => {

                    setState(() {
                      CorrectAns(true);



                    })
                  },
                  child: Text(
                    "True",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Container(
                height: 70.0,
                color: Colors.red,
                margin: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () => {
                    setState(() {
                      CorrectAns(false);



                    })
                  },
                  child: Text(
                    "False",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Row(
                children: icon,
              )
            ],
          ),
        ),
      );
  }
}
