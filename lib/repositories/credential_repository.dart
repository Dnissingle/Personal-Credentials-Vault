import 'package:sqflite/sqflite.dart';
import '../models/credential.dart';
import '../models/enums.dart';
import '../services/database_service.dart';

class CredentialRepository {
  Future<Database> get _db async => DatabaseService.instance.database;

  static const String table = 'credentials';

  Map<String, dynamic> _toMap(Credential c) => {
    'id': c.id,
    'title': c.title,
    'username': c.username,
    'password': c.password,
    'url': c.url,
    'notes': c.notes,
    'category': c.category.name,
    'created_at': c.createdAt.millisecondsSinceEpoch,
    'updated_at': c.updatedAt.millisecondsSinceEpoch,
  };

  Credential _fromMap(Map<String, dynamic> map) => Credential(
    id: map['id'] as String,
    title: map['title'] as String,
    username: map['username'] as String,
    password: map['password'] as String,
    url: map['url'] as String?,
    notes: map['notes'] as String?,
    category: CredentialCategory.values.byName(map['category'] as String),
    createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
  );

  Future<void> insert(Credential credential) async {
    final db = await _db;
    await db.insert(table, _toMap(credential));
  }

  Future<void> update(Credential credential) async {
    final db = await _db;
    await db.update(
      table,
      _toMap(credential),
      where: 'id = ?',
      whereArgs: [credential.id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Credential>> getAll() async {
    final db = await _db;
    final maps = await db.query(table, orderBy: 'updated_at DESC');
    return maps.map(_fromMap).toList();
  }

  Future<Credential?> getById(String id) async {
    final db = await _db;
    final maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return _fromMap(maps.first);
  }
}