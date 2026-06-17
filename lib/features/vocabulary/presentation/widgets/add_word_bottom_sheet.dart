import 'package:flutter/material.dart';

import '../../domain/entities/word_entity.dart';

class AddWordBottomSheet extends StatefulWidget {
  final List<WordEntity> catalogWords;
  final Future<void> Function(WordEntity word) onSave;

  const AddWordBottomSheet({
    super.key,
    required this.catalogWords,
    required this.onSave,
  });

  @override
  State<AddWordBottomSheet> createState() => _AddWordBottomSheetState();
}

class _AddWordBottomSheetState extends State<AddWordBottomSheet> {
  final wordController = TextEditingController();
  final meaningController = TextEditingController();
  final translationController = TextEditingController();

  TextEditingController? _autocompleteController;
  bool isSaving = false;

  bool get isValid =>
      wordController.text.trim().isNotEmpty &&
      meaningController.text.trim().isNotEmpty &&
      translationController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    wordController.addListener(_onTextChanged);
    meaningController.addListener(_onTextChanged);
    translationController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  Future<void> _saveWord() async {
    if (!isValid || isSaving) {
      return;
    }

    setState(() {
      isSaving = true;
    });

    final word = WordEntity(
      word: wordController.text.trim(),
      meaning: meaningController.text.trim(),
      translation: translationController.text.trim(),
    );

    try {
      await widget.onSave(word);

      if (mounted) {
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Word saved successfully')),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  void _fillWord(String value) {
    final selectedWord = widget.catalogWords.firstWhere(
      (word) => word.word == value,
    );

    wordController.text = selectedWord.word;
    _autocompleteController?.text = selectedWord.word;
    meaningController.text = selectedWord.meaning;
    translationController.text = selectedWord.translation;
  }

  @override
  void dispose() {
    wordController.dispose();
    meaningController.dispose();
    translationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Add Word',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Autocomplete<String>(
            optionsBuilder: (textEditingValue) {
              final query = textEditingValue.text.trim().toLowerCase();

              if (query.isEmpty) {
                return widget.catalogWords.map((word) => word.word);
              }

              return widget.catalogWords
                  .where((word) => word.word.toLowerCase().contains(query))
                  .map((word) => word.word);
            },
            onSelected: _fillWord,
            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) {
                  if (_autocompleteController != textEditingController) {
                    _autocompleteController = textEditingController;
                    textEditingController.addListener(() {
                      if (wordController.text != textEditingController.text) {
                        wordController.text = textEditingController.text;
                      }
                    });
                  }

                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Word',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: meaningController,
            minLines: 1,
            maxLines: 3,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Meaning',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: translationController,
            minLines: 1,
            maxLines: 3,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'Translation',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isValid && !isSaving ? _saveWord : null,
              child: Text(isSaving ? 'Saving...' : 'Save Word'),
            ),
          ),
        ],
      ),
    );
  }
}
