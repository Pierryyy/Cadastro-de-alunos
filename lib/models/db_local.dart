import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBlocal {
  final String table, dbname;
  DBlocal({
    required this.dbname,
    required this.table,
  });

  Future<Database> getConnection() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbname);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $table(id PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT NOT NULL)");
    });
  }
}
