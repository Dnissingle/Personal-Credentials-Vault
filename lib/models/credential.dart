import 'enums.dart';

class Credential {
  final String id;
  String title;
  String username;
  String password; // Plaintext in memory only — encrypted at rest starting Phase 5
  String? url;
  String? notes;
  CredentialCategory category;
  final DateTime createdAt;
  DateTime updatedAt;

  Credential({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
    this.url,
    this.notes,
    this.category = CredentialCategory.general,
    required this.createdAt,
    required this.updatedAt,
  });

  // password/notes deliberately excluded so debugPrint/logs never leak secrets.
  @override
  String toString() =>
      'Credential(id: $id, title: $title, username: $username, category: $category)';
}