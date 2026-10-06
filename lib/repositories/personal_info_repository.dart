import 'package:sqflite/sqflite.dart';
import '../models/personal_info.dart';
import '../models/enums.dart';
import '../services/database_service.dart';

class PersonalInfoRepository {
  Future<Database> get _db async => DatabaseService.instance.database;

  static const String table = 'personal_info';

  Map<String, dynamic> _toMap(PersonalInfo p) => {
    'id': p.id,
    'label': p.label,
    'value': p.value,
    'category': p.category.name,
    'notes': p.notes,
    'created_at': p.createdAt.millisecondsSinceEpoch,
    'updated_at': p.updatedAt.millisecondsSinceEpoch,
  };

  PersonalInfo _fromMap(Map<String, dynamic> map) => PersonalInfo(
    id: map['id'] as String,
    label: map['label'] as String,
    value: map['value'] as String,
    category: PersonalInfoCategory.values.byName(map['category'] as String),
    notes: map['notes'] as String?,
    createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
  );

  Future<void> insert(PersonalInfo info) async {
    final db = await _db;
    await db.insert(table, _toMap(info));
  }

  Future<void> update(PersonalInfo info) async {
    final db = await _db;
    await db.update(table, _toMap(info), where: 'id = ?', whereArgs: [info.id]);
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<PersonalInfo>> getAll() async {
    final db = await _db;
    final maps = await db.query(table, orderBy: 'updated_at DESC');
    return maps.map(_fromMap).toList();
  }

  Future<PersonalInfo?> getById(String id) async {
    final db = await _db;
    final maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return _fromMap(maps.first);
  }
}