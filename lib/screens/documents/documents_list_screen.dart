import 'package:flutter/material.dart';

import '../../widgets/empty_state.dart';

class DocumentsListScreen extends StatelessWidget {
  const DocumentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Documents & Certificates')),
      body: const EmptyState(
        icon: Icons.description_outlined,
        message: 'No documents saved yet.\nTap + to attach one.',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(Phase 7): open add document/certificate form
          // (metadata + optional attached image/PDF + expiry date).
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
