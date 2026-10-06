import 'package:sqflite/sqflite.dart';
import '../models/social_account.dart';
import '../services/database_service.dart';

class SocialAccountRepository {
  Future<Database> get _db async => DatabaseService.instance.database;

  static const String table = 'social_accounts';

  Map<String, dynamic> _toMap(SocialAccount s) => {
    'id': s.id,
    'platform': s.platform,
    'handle': s.handle,
    'password': s.password,
    'profile_url': s.profileUrl,
    'notes': s.notes,
    'created_at': s.createdAt.millisecondsSinceEpoch,
    'updated_at': s.updatedAt.millisecondsSinceEpoch,
  };

  SocialAccount _fromMap(Map<String, dynamic> map) => SocialAccount(
    id: map['id'] as String,
    platform: map['platform'] as String,
    handle: map['handle'] as String,
    password: map['password'] as String?,
    profileUrl: map['profile_url'] as String?,
    notes: map['notes'] as String?,
    createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
  );

  Future<void> insert(SocialAccount account) async {
    final db = await _db;
    await db.insert(table, _toMap(account));
  }

  Future<void> update(SocialAccount account) async {
    final db = await _db;
    await db.update(table, _toMap(account), where: 'id = ?', whereArgs: [account.id]);
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<SocialAccount>> getAll() async {
    final db = await _db;
    final maps = await db.query(table, orderBy: 'updated_at DESC');
    return maps.map(_fromMap).toList();
  }

  Future<SocialAccount?> getById(String id) async {
    final db = await _db;
    final maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return _fromMap(maps.first);
  }
}