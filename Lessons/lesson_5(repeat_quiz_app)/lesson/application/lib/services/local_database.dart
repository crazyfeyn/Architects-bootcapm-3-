import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  LocalDatabase._constructor();

  static final LocalDatabase _localDatabase = LocalDatabase._constructor();

  factory LocalDatabase() {
    return _localDatabase;
  }

  late Database? _database;

  Future<Database> get database async {
    if (_database!.isOpen) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  static const databaseName = 'notesTable.db';
  static const tableName = 'todo';

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$databaseName';

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL,
        isCompleted INTEGER NOT NULL
      )
    ''');
  }

  Future<void> addTodo(
      String title, String description, String date, bool isCompleted) async {
    var db = await database;
    await db.insert(tableName, {
      'title': title,
      'description': description,
      'date': date,
      'isCompleted': isCompleted ? 1 : 0
    });
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    var db = await database;
    var todos = await db.query(tableName);
    return todos;
  }
}
