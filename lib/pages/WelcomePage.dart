import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_tp3/core/api/ApiConnexion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../components/CoolBottom.dart';
import '../core/data/Question.dart';
import '../core/data/Quiz.dart';
import 'package:lottie/lottie.dart';

import 'QuestionPage.dart';
String lastUpdate = "" ;
class WelcomePage extends StatelessWidget {
  String animation = "animations/animationQuiz.json";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome 🤖!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
             Text(
              "Last upddate DB : $lastUpdate",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            Lottie.asset(animation),
            const SizedBox(height: 20),
            const Text(
              'Redy my friend ?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            CoolButton(
              text: 'Try your chance!',
              onPressed: () async {
                final String s = await getQuestions();

                Map<String, dynamic> jsonMap = jsonDecode(s);
                Quiz quiz = Quiz.fromJson(jsonMap);
                saveDate();
                getLastUpdateTime();
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return QuestionPage(
                          questionsBase: quiz.questions
                      );
                    }));

              },),
          ],
        ),
      ),
    );
  }

}
void getLastUpdateTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  lastUpdate = prefs.getString('lastUpdate')!;
}
Future<void> saveDate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String timeSpecific = "00:05:00";
  prefs.setString('lastUpdate', DateTime.now().toString());
}

Future<void> isTimeToDownload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int actualMinutes = DateTime.now().minute.toInt();
    String? lastUpdate_String = prefs.getString('lastUpdate');

    final lastUpdate = DateTime.parse(lastUpdate_String!);

    final DateTime checkCurrent = DateTime.now().add(Duration(minutes: 0));
    final DateTime checkFutureLast = lastUpdate.add(Duration(minutes: 0));
    bool diff1 = checkCurrent.isAfter(checkFutureLast);

    print("Resultat : $diff1");
}