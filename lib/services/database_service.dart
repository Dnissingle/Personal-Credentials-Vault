import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._internal();
  static final DatabaseService instance = DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'secure_vault.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE credentials (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        url TEXT,
        notes TEXT,
        category TEXT NOT NULL,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE vault_documents (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        document_type TEXT NOT NULL,
        file_path TEXT,
        issue_date INTEGER,
        expiry_date INTEGER,
        notes TEXT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE personal_info (
        id TEXT PRIMARY KEY,
        label TEXT NOT NULL,
        value TEXT NOT NULL,
        category TEXT NOT NULL,
        notes TEXT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE social_accounts (
        id TEXT PRIMARY KEY,
        platform TEXT NOT NULL,
        handle TEXT NOT NULL,
        password TEXT,
        profile_url TEXT,
        notes TEXT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE authenticator_entries (
        id TEXT PRIMARY KEY,
        issuer TEXT NOT NULL,
        account_name TEXT NOT NULL,
        secret_key TEXT NOT NULL,
        algorithm TEXT NOT NULL,
        digits INTEGER NOT NULL,
        period INTEGER NOT NULL,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');
  }
}