class Reponse {
  int id;
  String intitule;

  Reponse({required this.id, required this.intitule});

  // Convertit un objet Reponse en une chaîne JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'intitule': intitule,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'intitule': intitule,
    };
  }


  // Crée un objet Reponse à partir d'une chaîne JSON
  factory Reponse.fromJson(Map<String, dynamic> json) {
    return Reponse(
      id: json['id'],
      intitule: json['intitule'],
    );
  }

  factory Reponse.fromMap(Map<String, dynamic> map) {
    return Reponse(
      id: map['id'] as int,
      intitule: map['intitule'] as String,
    );
  }
}
