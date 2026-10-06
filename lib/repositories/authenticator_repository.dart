import 'package:sqflite/sqflite.dart';
import '../models/authenticator_entry.dart';
import '../services/database_service.dart';

class AuthenticatorRepository {
  Future<Database> get _db async => DatabaseService.instance.database;

  static const String table = 'authenticator_entries';

  Map<String, dynamic> _toMap(AuthenticatorEntry a) => {
    'id': a.id,
    'issuer': a.issuer,
    'account_name': a.accountName,
    'secret_key': a.secretKey,
    'algorithm': a.algorithm,
    'digits': a.digits,
    'period': a.period,
    'created_at': a.createdAt.millisecondsSinceEpoch,
    'updated_at': a.updatedAt.millisecondsSinceEpoch,
  };

  AuthenticatorEntry _fromMap(Map<String, dynamic> map) => AuthenticatorEntry(
    id: map['id'] as String,
    issuer: map['issuer'] as String,
    accountName: map['account_name'] as String,
    secretKey: map['secret_key'] as String,
    algorithm: map['algorithm'] as String,
    digits: map['digits'] as int,
    period: map['period'] as int,
    createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
  );

  Future<void> insert(AuthenticatorEntry entry) async {
    final db = await _db;
    await db.insert(table, _toMap(entry));
  }

  Future<void> update(AuthenticatorEntry entry) async {
    final db = await _db;
    await db.update(table, _toMap(entry), where: 'id = ?', whereArgs: [entry.id]);
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<AuthenticatorEntry>> getAll() async {
    final db = await _db;
    final maps = await db.query(table, orderBy: 'updated_at DESC');
    return maps.map(_fromMap).toList();
  }

  Future<AuthenticatorEntry?> getById(String id) async {
    final db = await _db;
    final maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return _fromMap(maps.first);
  }
}