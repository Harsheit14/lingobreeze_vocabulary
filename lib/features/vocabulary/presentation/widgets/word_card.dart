import 'package:flutter/material.dart';

import '../../domain/entities/word_entity.dart';

class WordCard extends StatelessWidget {
  final WordEntity word;

  const WordCard({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.word,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Meaning',
              style: textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              word.meaning,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Translation',
              style: textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              word.translation,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
