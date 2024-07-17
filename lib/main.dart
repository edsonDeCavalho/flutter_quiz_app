import 'package:flutter/material.dart';
import 'package:quiz_tp3/pages/QuestionPage.dart';
import 'package:quiz_tp3/pages/ResultatPage.dart';
import 'package:quiz_tp3/pages/WelcomePage.dart';
import '../syle/all_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

//StatelessWidget content that doesn't change
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      // theme: ThemeData(
      //   fontFamily: 'AlegreyaSans',
      //   //scaffoldBackgroundColor: const Color(0xFFEFEFEF),
      //   scaffoldBackgroundColor: AppColor.backgroundBlue,
      //   //scaffoldBackgroundColor: const AppColor.secondary3,
      // ),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // Start the app with the "/" named route. In this case, the app starts
      // on the BeginScreen widget.

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => WelcomePage(),
        '/question': (context) => QuestionPage(),
        '/resultat': (context) => ResultPage(reponsesUtilisateur: [])
      },
      debugShowCheckedModeBanner: false,
    );
  }
}