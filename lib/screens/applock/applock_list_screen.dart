import 'package:flutter/material.dart';

import '../../widgets/empty_state.dart';

class ApplockListScreen extends StatelessWidget {
  const ApplockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Lock'),
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
                // TODO(Phase 6): filter the app lock list by query.
              },
            ),
          ),
        ),
      ),
      body: const EmptyState(
        icon: Icons.lock,
        message: 'No apps locked yet.\nTap + to add your first one.',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(Phase 6): open add/edit app lock form.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
