import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const SecureVaultApp());
}


//  // smoke test database
// import 'package:flutter/material.dart';
// import 'models/credential.dart';
// import 'models/enums.dart';
// import 'repositories/credential_repository.dart';
// import 'app.dart';
//
// Future<void> _smokeTestDatabase() async {
//   final repo = CredentialRepository();
//   final now = DateTime.now();
//
//   final testCredential = Credential(
//     id: now.microsecondsSinceEpoch.toString(),
//     title: 'Smoke Test Entry',
//     username: 'testuser',
//     password: 'temporary-test-value', // never a real password
//     category: CredentialCategory.general,
//     createdAt: now,
//     updatedAt: now,
//   );
//
//   await repo.insert(testCredential);
//   final all = await repo.getAll();
//
//   // Deliberately NOT logging password — only non-sensitive fields.
//   debugPrint('Smoke test: ${all.length} credential(s) in DB');
//   for (final c in all) {
//     debugPrint(' - ${c.title} (${c.username}, ${c.category.name})');
//   }
//
//   // Clean up so repeated runs don't accumulate test rows.
//   await repo.delete(testCredential.id);
//   final afterDelete = await repo.getAll();
//   debugPrint('After cleanup: ${afterDelete.length} credential(s) remain');
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // required before any plugin (sqflite) call
//   await _smokeTestDatabase();
//   runApp(const SecureVaultApp()); // keep your existing app entry point here
// }