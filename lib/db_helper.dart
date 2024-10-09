import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('restaurant.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const tableTableSQL = '''
      CREATE TABLE tables (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        status TEXT NOT NULL
      );
    ''';

    const ordersTableSQL = '''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tableId INTEGER NOT NULL,
        productName TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        status TEXT NOT NULL, -- Added status for the order (e.g., delivered, pending)
        FOREIGN KEY (tableId) REFERENCES tables (id)
      );
    ''';

    const usersTableSQL = '''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL -- admin or staff
      );
    ''';

    await db.execute(tableTableSQL);
    await db.execute(ordersTableSQL);
    await db.execute(usersTableSQL);

    // Insert a default admin user
    await db.insert('users', {
      'username': 'admin',
      'password': 'admin123',
      'role': 'admin',
    });
  }

  Future<void> insertTable(String status) async {
    final db = await instance.database;
    await db.insert('tables', {'status': status});
  }

  Future<void> updateTableStatus(int id, String status) async {
    final db = await instance.database;
    await db.update('tables', {'status': status}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertOrder(int tableId, String productName, int quantity) async {
    final db = await instance.database;
    await db.insert('orders', {
      'tableId': tableId,
      'productName': productName,
      'quantity': quantity,
      'status': 'pending' // Default order status is pending
    });
  }

  Future<void> updateOrderStatus(int id, String status) async {
    final db = await instance.database;
    await db.update('orders', {'status': status}, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getTables() async {
    final db = await instance.database;
    return await db.query('tables');
  }

  Future<List<Map<String, dynamic>>> getOrdersByTable(int tableId) async {
    final db = await instance.database;
    return await db.query('orders', where: 'tableId = ?', whereArgs: [tableId]);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }

  Future<void> insertUser(String username, String password, String role) async {
    final db = await instance.database;
    await db.insert('users', {'username': username, 'password': password, 'role': role});
  }

  Future<Map<String, dynamic>?> authenticateUser(String username, String password) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
