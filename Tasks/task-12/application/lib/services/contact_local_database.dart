import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class ContactLocalDatabase {
  ContactLocalDatabase._singleton();

  static final ContactLocalDatabase contactLocalDatabase =
      ContactLocalDatabase._singleton();

  factory ContactLocalDatabase() {
    return contactLocalDatabase;
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
    final databasePath = getDatabasesPath();
    final path = '$databasePath/contacts2.db';

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        contact_name TEXT NOT NULL,
        contact_number TEXT NOT NULL
      )
      ''');
  }

  Future<void> addContact(String contactName, String contactNumber) async {
    var db = await database;
    await db.insert('contacts',
        {'contact_name': contactName, 'contact_number': contactNumber});
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    var db = await database;
    var contacts = await db.query('contacts');
    return contacts;
  }

  Future<void> deleteContact(Map<String, dynamic> contact) async {
    var db = await database;
    await db.delete('contacts',
        where: 'contact_number = ?', whereArgs: [contact['contact_number']]);
  }

  Future<void> updateContact(
      Map<String, dynamic> contact, Map<String, dynamic> oldContact) async {
    var db = await database;
    List<Map<String, dynamic>> newGetter = await getContacts();
    int forId = -1;
    for (var i in newGetter) {
      if (i['contact_name'] == oldContact['contact_name'] ||
          i['contact_number'] == oldContact['contact_number']) {
        forId = i['id'];
      }
      // print("${i['contact_name']} = ${contact['contact_name']}");
    }
    await db.update(
      'contacts',
      {
        'contact_name': contact['contact_name'],
        'contact_number': contact['contact_number'],
      },
      where: 'id = ?',
      whereArgs: [forId],
    );
  }
}
