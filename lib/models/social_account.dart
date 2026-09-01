class SocialAccount {
  final String id;
  String platform; // e.g. "Instagram", "Facebook"
  String handle;
  String? password;
  String? profileUrl;
  String? notes;
  final DateTime createdAt;
  DateTime updatedAt;

  SocialAccount({
    required this.id,
    required this.platform,
    required this.handle,
    this.password,
    this.profileUrl,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  String toString() => 'SocialAccount(id: $id, platform: $platform, handle: $handle)';
}