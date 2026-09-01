import 'enums.dart';

class PersonalInfo {
  final String id;
  String label; // e.g. "Passport Number", "Blood Group"
  String value;
  PersonalInfoCategory category;
  String? notes;
  final DateTime createdAt;
  DateTime updatedAt;

  PersonalInfo({
    required this.id,
    required this.label,
    required this.value,
    this.category = PersonalInfoCategory.identity,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  // value omitted from toString — it's sensitive.
  @override
  String toString() => 'PersonalInfo(id: $id, label: $label, category: $category)';
}