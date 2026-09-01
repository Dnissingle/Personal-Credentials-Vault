import 'package:flutter/material.dart';

import '../../widgets/empty_state.dart';

class AuthenticatorListScreen extends StatelessWidget {
  const AuthenticatorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticator'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                isDense: true,
              ),
              onChanged: (_) {
                // TODO(Phase 6): filter the authenticator list by query.
              },
            ),
          ),
        ),
      ),
      body: const EmptyState(
        icon: Icons.enhanced_encryption_outlined,
        message: 'No authenticator saved yet.\nTap + to add your first one.',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(Phase 6): open add/edit authenticator form.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
