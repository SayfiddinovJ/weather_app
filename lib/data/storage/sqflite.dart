import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/data/models/weather/model_fields.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static String dataPath = '';

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("weather.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    dataPath = path;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE ${WeatherModelFields.dbTable} (
    ${WeatherModelFields.id} $idType,
    ${WeatherModelFields.region} $textType,
    ${WeatherModelFields.country} $textType
    )
    ''');
  }

  static Future<StorageModel> insert(StorageModel model) async {
    final db = await getInstance.database;
    final int id = await db.insert(WeatherModelFields.dbTable, model.toJson());
    return model.copyWith(id: id);
  }

  static Future<List<StorageModel>> getAll() async {
    List<StorageModel> allList = [];
    final db = await getInstance.database;
    allList =
        (await db.query(
          WeatherModelFields.dbTable,
        )).map((e) => StorageModel.fromJson(e)).toList();
    return allList;
  }

  static delete(int id) async {
    final db = await getInstance.database;
    db.delete(
      WeatherModelFields.dbTable,
      where: "${WeatherModelFields.id} = ?",
      whereArgs: [id],
    );
  }
}
