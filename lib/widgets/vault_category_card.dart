import 'package:flutter/material.dart';

/// A tappable card used on the dashboard for each vault section
/// (Credentials, Documents, Personal Info, Social Media).
class VaultCategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const VaultCategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(icon, color: colorScheme.onPrimaryContainer),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 16),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                  fontSize: 10.0, // Set your desired font size here
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
