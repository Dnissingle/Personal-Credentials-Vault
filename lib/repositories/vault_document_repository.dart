import 'package:sqflite/sqflite.dart';
import '../models/vault_document.dart';
import '../models/enums.dart';
import '../services/database_service.dart';

class VaultDocumentRepository {
  Future<Database> get _db async => DatabaseService.instance.database;

  static const String table = 'vault_documents';

  Map<String, dynamic> _toMap(VaultDocument d) => {
    'id': d.id,
    'title': d.title,
    'document_type': d.documentType.name,
    'file_path': d.filePath,
    'issue_date': d.issueDate?.millisecondsSinceEpoch,
    'expiry_date': d.expiryDate?.millisecondsSinceEpoch,
    'notes': d.notes,
    'created_at': d.createdAt.millisecondsSinceEpoch,
    'updated_at': d.updatedAt.millisecondsSinceEpoch,
  };

  VaultDocument _fromMap(Map<String, dynamic> map) => VaultDocument(
    id: map['id'] as String,
    title: map['title'] as String,
    documentType: DocumentType.values.byName(map['document_type'] as String),
    filePath: map['file_path'] as String?,
    issueDate: map['issue_date'] != null
        ? DateTime.fromMillisecondsSinceEpoch(map['issue_date'] as int)
        : null,
    expiryDate: map['expiry_date'] != null
        ? DateTime.fromMillisecondsSinceEpoch(map['expiry_date'] as int)
        : null,
    notes: map['notes'] as String?,
    createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
  );

  Future<void> insert(VaultDocument document) async {
    final db = await _db;
    await db.insert(table, _toMap(document));
  }

  Future<void> update(VaultDocument document) async {
    final db = await _db;
    await db.update(table, _toMap(document), where: 'id = ?', whereArgs: [document.id]);
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<VaultDocument>> getAll() async {
    final db = await _db;
    final maps = await db.query(table, orderBy: 'updated_at DESC');
    return maps.map(_fromMap).toList();
  }

  Future<VaultDocument?> getById(String id) async {
    final db = await _db;
    final maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return _fromMap(maps.first);
  }

  /// Documents expiring within [withinDays] — backs the reminder feature (Phase 7).
  Future<List<VaultDocument>> getExpiringSoon({int withinDays = 30}) async {
    final all = await getAll();
    return all.where((d) => d.isExpiringSoon(withinDays: withinDays)).toList();
  }
}