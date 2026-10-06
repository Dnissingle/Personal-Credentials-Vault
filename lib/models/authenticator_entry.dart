class AuthenticatorEntry {
  final String id;
  String issuer; // e.g. "Google"
  String accountName; // e.g. "user@gmail.com"
  String secretKey; // base32 TOTP secret — encrypted at rest starting Phase 5
  String algorithm;
  int digits;
  int period; // seconds per code rotation

  final DateTime createdAt;
  DateTime updatedAt;

  AuthenticatorEntry({
    required this.id,
    required this.issuer,
    required this.accountName,
    required this.secretKey,
    this.algorithm = 'SHA1',
    this.digits = 6,
    this.period = 30,
    required this.createdAt,
    required this.updatedAt,
  });

  // secretKey deliberately excluded from toString.
  @override
  String toString() => 'AuthenticatorEntry(id: $id, issuer: $issuer, accountName: $accountName)';
}