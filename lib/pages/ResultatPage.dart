import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/CoolBottom.dart';

class ResultPage extends StatelessWidget {
  final List<bool> reponsesUtilisateur;

  const ResultPage({super.key, required this.reponsesUtilisateur});

  @override
  Widget build(BuildContext context) {
    int correctAnswers = reponsesUtilisateur.where((answer) => answer).length;
    int totalQuestions = reponsesUtilisateur.length;
    String animation = "";
    String messageVersUtilisateur = "";

    print(this.reponsesUtilisateur);

    if(correctAnswers == totalQuestions){
      animation = "animations/congratulationsAnimation.json";
      messageVersUtilisateur = "Every answer was correct! 🤯";
    }else{
      animation = "animations/loserAnimation.json";
     if(totalQuestions-1==correctAnswers || totalQuestions-2==correctAnswers){
       messageVersUtilisateur = "Ouww almost 🥹";
       animation = "animations/congratulationsAnimation.json";
     }
     if(correctAnswers<totalQuestions/2){
       messageVersUtilisateur = "You faild my friend! 😂";
     }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Result of the Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              messageVersUtilisateur,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $correctAnswers of $totalQuestions',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Lottie.asset(animation),


            CoolButton(
              onPressed: () {
                // Revenir à l'écran d'accueil ou effectuer d'autres actions
                Navigator.pushNamed(
                  context,
                  '/',
                );
              },
              text: "Let's restart again wow!",
            ),
          ],
        ),
      ),
    );
  }
}