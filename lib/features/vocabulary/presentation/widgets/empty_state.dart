import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final VoidCallback onAddWord;

  const EmptyState({super.key, required this.onAddWord});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.menu_book_rounded,
              size: 90,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Your Vocabulary Journey Starts Here',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Save words you learn and build your personal vocabulary collection.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onAddWord,
              icon: const Icon(Icons.add),
              label: const Text('Add Your First Word'),
            ),
          ],
        ),
      ),
    );
  }
}
