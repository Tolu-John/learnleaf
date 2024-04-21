import 'package:learnleaf/core/constants/app_strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
  static final LocalDb _instance = LocalDb._(); // Private constructor

  static Database? _database;

  // Private constructor to prevent instantiation
  LocalDb._();

  static LocalDb get instance => _instance;

  // Getter for the database instance
  Future<Database> get database async {
    if (_database != null) {
      print("Database already initialized");
      return _database!;
    } else {
      print("Initializing database");
      _database = await _initDB(AppStrings.appName);
      return _database!;
    }
  }

  // Initialization of the database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {


    await db.execute(AppStrings.createUser);
    await db.execute(AppStrings.createCourse);
    await db.execute(AppStrings.createReview);
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }

}