import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static Database? _database;
  Future<Database?> openDB() async {
    _database = await openDatabase(join(await getDatabasesPath(), 'demo_db'));
  }
}
