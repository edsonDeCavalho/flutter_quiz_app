import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_tp3/core/data/ReponsesUtilisateur.dart';
import 'package:quiz_tp3/pages/ResultatPage.dart';

import '../components/CoolBottom.dart';
import '../core/api/ApiConnexion.dart';
import '../core/data/Question.dart';
import '../core/data/Quiz.dart';
import '../core/data/Reponse.dart';


class QuestionPage extends StatefulWidget {
  List<Question>? questionsBase;

  QuestionPage({Key? key, this.questionsBase}) : super(key: key);

  @override
  State createState() => _QuestionPageState(questionsBase);
}

class _QuestionPageState extends State<QuestionPage> {
  late List<Question> questionsBase_ = [
    // Question(intitule:"Flutter est développé par Google ?",bonneReponse:1,reponses: [Reponse(id:1,intitule:"Netflix"),Reponse(id:2,intitule:"Papajounes"),Reponse(id:3,intitule:"Ta mére"),Reponse(id:4,intitule:"Dancing queen")]),
    // Question(intitule:"Dart est le langage de programmation utilisé par Flutter?",bonneReponse: 1,reponses:[Reponse(id:1,intitule:"Netflix"),Reponse(id:2,intitule:"Hijo puta"),Reponse(id:3,intitule:"Netflix"),Reponse(id:4,intitule:"Netflix")]),
    // Question(intitule:"Flutter prend en charge le développement natif pour iOS et Android?",bonneReponse: 1,reponses:[Reponse(id:1,intitule:"Poptité"),Reponse(id:2,intitule:"Netflix"),Reponse(id:3,intitule:"Netflix"),Reponse(id:4,intitule:"Netflix")]),
    // Question(intitule:"Material Design est un langage de conception utilisé par Flutter?",bonneReponse: 1,reponses:[Reponse(id:1,intitule:"Cabron"),Reponse(id:2,intitule:"Cabron"),Reponse(id:3,intitule:"El papa"),Reponse(id:4,intitule:"Netflix")]),
  ];

  _QuestionPageState(List<Question>? questionsBase){
    questionsBase_=questionsBase!;
  }

  ReponcesUtilisateur reponcesUtilisateur= ReponcesUtilisateur(0, []);

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Afficher la question
            Text(
              questionsBase_[currentQuestionIndex].intitule,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Afficher les options de réponse
            CoolButton(
              onPressed: () {
                checkAnswer(questionsBase_[currentQuestionIndex].reponses[0].id);
              },
              text: questionsBase_[currentQuestionIndex].reponses[0].intitule,
            ),
            const SizedBox(height: 10),
            CoolButton(
              onPressed: () {
                checkAnswer(questionsBase_[currentQuestionIndex].reponses[1].id);
              },
              text:  questionsBase_[currentQuestionIndex].reponses[1].intitule,
            ),
            const SizedBox(height: 10),
            CoolButton(
              onPressed: () {
                checkAnswer(questionsBase_[currentQuestionIndex].reponses[2].id);
              },
              text:  questionsBase_[currentQuestionIndex].reponses[2].intitule,
            ),
            const SizedBox(height: 10),
            CoolButton(
              onPressed: () {
                checkAnswer(questionsBase_[currentQuestionIndex].reponses[3].id);
              },
              text: questionsBase_[currentQuestionIndex].reponses[3].intitule,
            ),
          ],
        ),
      ),
    );
  }
  //
  // // Vérifie la réponse et passe à la question suivante
  void checkAnswer(int? userChoice) {
    int correctAnswer = questionsBase_[currentQuestionIndex].bonneReponse;

    if (userChoice == correctAnswer) {
      reponcesUtilisateur.listeDeReponces.add(true);
      moveToNextQuestion();
    } else {
      reponcesUtilisateur.listeDeReponces.add(false);
      moveToNextQuestion();
    }
  }

  void moveToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questionsBase_.length - 1) {
        currentQuestionIndex++;
      } else {
        // Fin du quiz
        
        // Navigator.pushNamed(
        //   context,
        //   '/resultat',
        //   arguments: ResultPage(reponsesUtilisateur: reponcesUtilisateur.listeDeReponces),
        // );

        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return ResultPage(reponsesUtilisateur: reponcesUtilisateur.listeDeReponces);
            }));
      }
    });

  }
}


Future<List<Question>> getQuiz() async {
  final String s = await getQuestions();

  Map<String, dynamic> jsonMap = jsonDecode(s);
  Quiz quiz = Quiz.fromJson(jsonMap);
  return quiz.questions;
}
