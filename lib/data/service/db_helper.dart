import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/product_model.dart';

class DB_Helper {
  static Database? _db;

  // Database initialize
  static Future<Database> initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE cart(
          id INTEGER PRIMARY KEY,
          title TEXT,
          body TEXT,
          userId INTEGER,
          price REAL,
          imageUrl TEXT,
          quantity INTEGER
        )
        ''');
      },
    );
  }


  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB('cart.db');
    return _db!;
  }


  static Future<void> insertItem(ProductModel product) async {
    final db = await database;
    await db.insert(
      'cart',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  static Future<void> updateItem(ProductModel product) async {
    final db = await database;
    await db.update(
      'cart',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }


  static Future<void> deleteItem(int id) async {
    final db = await database;
    await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  static Future<List<ProductModel>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart');
    return List.generate(maps.length, (i) {
      return ProductModel.fromMap(maps[i]);
    });
  }


  static Future<double> getTotalPrice() async {
    final db = await database;
    final result =
    await db.rawQuery('SELECT SUM(price * quantity) as total FROM cart');
    return result.first['total'] == null
        ? 0.0
        : result.first['total'] as double;
  }


  static Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }
}
