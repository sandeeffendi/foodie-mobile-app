import 'package:assestment_restaurant_app/core/data/model/favorite/favorite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Database helper singleton
class FavoritesDb {
  // Singleton instance
  static final FavoritesDb _instance = FavoritesDb._internal();
  factory FavoritesDb() => _instance;
  FavoritesDb._internal();

  late final Future<Database> _database = _initDatabase();

  // Table & columns
  static const String tableFavorites = 'favorites';

  Future<Database> get db => _database;

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'favorites.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableFavorites(
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            city TEXT NOT NULL,
            rating REAL NOT NULL,
            pictureId TEXT NOT NULL
          );
        ''');
      },
    );
  }

  /// Ambil semua data favorit
  Future<List<Favorite>> getAll() async {
    final maps = await (await db).query(tableFavorites, orderBy: 'name ASC');
    return maps.map((m) => Favorite.fromMap(m)).toList();
  }

  /// Insert atau update (upsert)
  Future<void> upsert(Favorite favorite) async {
    await (await db).insert(
      tableFavorites,
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Hapus data berdasarkan id
  Future<void> delete(String id) async {
    await (await db).delete(tableFavorites, where: 'id = ?', whereArgs: [id]);
  }

  /// Cek apakah data ada
  Future<bool> exists(String id) async {
    final result = await (await db).query(
      tableFavorites,
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}
