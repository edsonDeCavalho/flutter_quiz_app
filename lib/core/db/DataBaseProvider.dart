import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final DatabaseProvider db = DatabaseProvider();

  // Créer une instance de la base de données
  Database? _database;

  // Méthode pour récupérer la base de données
  Future<Database> get database async {
    // Si la base de données existe déjà, on la retourne
    if (_database != null) {
      return _database!;
    }

    // Sinon, on la crée
    _database = await createDatabase();
    return _database!;
  }

  // Méthode pour créer la base de données
  Future<Database> createDatabase() async {
    // Récupérer le chemin de la base de données
    String path = join(await getDatabasesPath(), 'database.db');

    // Créer la base de données
    return await openDatabase(
      path,
      version: 1, // Version de la base de données
      onCreate: (Database database, int version) async {
        // Créer la table
        await database.execute(
          'CREATE TABLE questions (id INTEGER PRIMARY KEY AUTOINCREMENT,intitule TEXT,bonneReponse INTEGER)',
        );
      },
    );
  }
}