import 'package:flutter/material.dart';

import '../../core/constants/app_routes.dart';
import '../../widgets/vault_category_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO(Phase 6/7): global search across credentials/documents.
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
          children: [
            VaultCategoryCard(
              icon: Icons.person_outline,
              title: 'Personal Info',
              subtitle: 'Not set',
              onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
            ),
            VaultCategoryCard(
              icon: Icons.password,
              title: 'Credentials',
              subtitle: '0 saved',
              onTap: () => Navigator.pushNamed(context, AppRoutes.credentials),
            ),
            VaultCategoryCard(
              icon: Icons.description_outlined,
              title: 'ID Documents',
              subtitle: '0 saved',
              onTap: () => Navigator.pushNamed(context, AppRoutes.documents),
            ),
            VaultCategoryCard(
              icon: Icons.account_box,
              title: 'Certificates',
              subtitle: '0 saved',
              onTap: () => Navigator.pushNamed(context, AppRoutes.documents),
            ),
            VaultCategoryCard(
              icon: Icons.screen_lock_portrait,
              title: 'App Locker',
              subtitle: '0 Locked',
              onTap: () => Navigator.pushNamed(context, AppRoutes.applock),
            ),
            VaultCategoryCard(
              icon: Icons.key,
              title: 'Authenticator',
              subtitle: '0 saved',
              onTap: () => Navigator.pushNamed(context, AppRoutes.authenticator),
            ),
            VaultCategoryCard(
              icon: Icons.share_outlined,
              title: 'Social Media',
              subtitle: '0 saved',
              onTap: () => Navigator.pushNamed(context, AppRoutes.social),
            ),
          ],
        ),
      ),
    );
  }
}
