import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../data/Question.dart';


class QuestionsDao {
  static final QuestionsDao instance = QuestionsDao._init();
  static Database? _database;

  QuestionsDao._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('questions.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE questions (
  id $idType,
  intitule $textType,
  bonneReponse INTEGER NOT NULL
)
''');
    // Ajoutez ici la création d'autres tables si nécessaire, par exemple pour les réponses
  }

  Future<Question> create(Question question) async {
    final db = await instance.database;
    final id = await db.insert('questions', question.toMap());
    return question.copy(id: id);
  }

  Future<Question> readQuestion(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'questions',
      columns: ['id', 'intitule', 'bonneReponse'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Question.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Question>> readAllQuestions() async {
    final db = await instance.database;
    final orderBy = 'id ASC';
    final result = await db.query('questions', orderBy: orderBy);

    return result.map((json) => Question.fromMap(json)).toList();
  }

  Future<int> update(Question question) async {
    final db = await instance.database;
    return db.update(
      'questions',
      question.toMap(),
      where: 'id = ?',
      whereArgs: [question.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'questions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
