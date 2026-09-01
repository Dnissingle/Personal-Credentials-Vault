import 'package:flutter/material.dart';

import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'screens/applock/applock_list_screen.dart';
import 'screens/auth/unlock_screen.dart';
import 'screens/authenticator/authenticator_list_screen.dart';
import 'screens/credentials/credentials_list_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/documents/documents_list_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/social/social_list_screen.dart';

class SecureVaultApp extends StatelessWidget {
  const SecureVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Vault',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.unlock,
      routes: {
        AppRoutes.unlock: (context) => const UnlockScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.credentials: (context) => const CredentialsListScreen(),
        AppRoutes.documents: (context) => const DocumentsListScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.social: (context) => const SocialListScreen(),
        AppRoutes.applock: (context) => const ApplockListScreen(),
        AppRoutes.authenticator: (context) => const AuthenticatorListScreen(),
      },
    );
  }
}
