import 'package:flutter/material.dart';

import '../../widgets/empty_state.dart';

class CredentialsListScreen extends StatelessWidget {
  const CredentialsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credentials'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search credentials',
                prefixIcon: Icon(Icons.search),
                isDense: true,
              ),
              onChanged: (_) {
                // TODO(Phase 6): filter the credentials list by query.
              },
            ),
          ),
        ),
      ),
      body: const EmptyState(
        icon: Icons.password,
        message: 'No credentials saved yet.\nTap + to add your first one.',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(Phase 6): open add/edit credential form.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
