import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Info')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ReadOnlyField(label: 'Full name', value: 'Not set'),
          _ReadOnlyField(label: 'Date of birth', value: 'Not set'),
          _ReadOnlyField(label: 'Phone', value: 'Not set'),
          _ReadOnlyField(label: 'Email', value: 'Not set'),
          _ReadOnlyField(label: 'Address', value: 'Not set'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(Phase 6): open edit personal info form.
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const _ReadOnlyField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }
}
