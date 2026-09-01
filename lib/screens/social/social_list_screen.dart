import 'package:flutter/material.dart';

import '../../widgets/empty_state.dart';

class SocialListScreen extends StatelessWidget {
  const SocialListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social Media')),
      body: const EmptyState(
        icon: Icons.share_outlined,
        message: 'No social accounts saved yet.\nTap + to add one.',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(Phase 6): open add social account form.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
