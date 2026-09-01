import 'enums.dart';

class VaultDocument {
  final String id;
  String title;
  DocumentType documentType;
  String? filePath; // local path to attached image/PDF
  DateTime? issueDate;
  DateTime? expiryDate;
  String? notes;
  final DateTime createdAt;
  DateTime updatedAt;

  VaultDocument({
    required this.id,
    required this.title,
    this.documentType = DocumentType.other,
    this.filePath,
    this.issueDate,
    this.expiryDate,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  /// True if the expiry date has already passed.
  bool get isExpired => expiryDate != null && expiryDate!.isBefore(DateTime.now());

  /// True if expiry is within [withinDays] days — used for reminder logic later.
  bool isExpiringSoon({int withinDays = 30}) {
    if (expiryDate == null) return false;
    final daysLeft = expiryDate!.difference(DateTime.now()).inDays;
    return daysLeft >= 0 && daysLeft <= withinDays;
  }

  @override
  String toString() =>
      'VaultDocument(id: $id, title: $title, type: $documentType, expiryDate: $expiryDate)';
}