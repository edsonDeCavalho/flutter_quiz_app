import 'dart:convert';

import 'package:http/http.dart';

import 'Reponse.dart';

class Question {
  int? id;
  String intitule;
  int bonneReponse;
  List<Reponse> reponses;

  Question({required this.intitule, required this.bonneReponse, required this.reponses, int? id});

  // Convertit un objet Question en une chaîne JSON
  Map<String, dynamic> toJson() {
    return {
      'intitule': intitule,
      'bonneReponse': bonneReponse,
      'reponses': reponses.map((reponse) => reponse.toJson()).toList(),
    };
  }


  factory Question.fromJson(Map<String, dynamic> json) {
    var reponsesList = json['reponses'] as List;
    List<Reponse> reponses = reponsesList.map((i) => Reponse.fromJson(i)).toList();

    return Question(
      intitule: json['intitule'],
      bonneReponse: json['bonneReponse'],
      reponses: reponses,
    );
  }

  Map<String, dynamic> toMap() {
    var map = {
      'intitule': intitule,
      'bonneReponse': bonneReponse,
      'reponses': jsonEncode(reponses.map((r) => r.toMap()).toList()),
    };

    if (id != null) {
      map['id'] = id as int; // Inclure l'id seulement s'il est non nul
    }

    return map;
  }

  Question copy({
    int? id,
    String? intitule,
    int? bonneReponse,
    List<Reponse>? reponses,
  }) {
    return Question(
      id: id ?? this.id,
      intitule: intitule ?? this.intitule,
      bonneReponse: bonneReponse ?? this.bonneReponse,
      reponses: reponses ?? this.reponses,
    );
  }

  // Crée une instance de Question à partir d'une Map (pour la désérialisation)
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      intitule: map['intitule'] as String,
      bonneReponse: map['bonneReponse'] as int,
      reponses: List<Reponse>.from(
        map['reponses'].map(
              (x) => Reponse.fromMap(x),
        ),
      ),
    );
  }
}

