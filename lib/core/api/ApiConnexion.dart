import 'package:http/http.dart' as http;

Future<String> getQuestions() async {
  var response = await http.get(Uri.parse('https://flutter-learning-iim.web.app/json/questions.json'));

  if (response.statusCode == 200) {
    print("Données récupérées : ${response.body}");


    // Read the fil
    String contents = await response.body;

    return contents; // This is the file content as a String.
  } else {
    throw Exception('Échec de la récupération des données.');
  }
}


Future<String> getQuestions2() async {
  var url = Uri.parse('https://flutter-learning-iim.web.app/json/questions.json');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // then parse the JSON.
      return response.body; // response.body is already a String
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load questions');
    }
  } catch (e) {
    // Handle any errors that occur during the HTTP request.
    throw Exception('Failed to load questions: $e');
  }
}

void fetchQuestions() async {
  try {
    String questionsJson = await getQuestions2();
    print(questionsJson); // This is the JSON as a String.
  } catch (e) {
    print('Error occurred: $e');
  }
}
