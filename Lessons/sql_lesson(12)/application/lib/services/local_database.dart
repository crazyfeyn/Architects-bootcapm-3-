import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  LocalDatabase._singelton();

  static final LocalDatabase _localDatabase = LocalDatabase._singelton();

  factory LocalDatabase() {
    return _localDatabase;
  }

  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/notes.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        created_time INTEGER NOT NULL
      );
    ''');
  }

  Future<void> addNote(String title) async {
    await _database!.insert("notes", {
      'title': title,
      "content": "sjkfnknfjsk  snfksnxsknfks fdsfsfs",
      "created_time": DateTime.now().millisecond,
    });
  }
}