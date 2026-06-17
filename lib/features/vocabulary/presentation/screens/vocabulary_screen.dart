import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/vocabulary_controller.dart';
import '../controllers/vocabulary_state.dart';
import '../widgets/add_word_bottom_sheet.dart';
import '../widgets/empty_state.dart';
import '../widgets/error_state.dart';
import '../widgets/loading_state.dart';
import '../widgets/word_card.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VocabularyController>();

    void openBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) {
          return AddWordBottomSheet(
            catalogWords: controller.catalogWords,
            onSave: controller.saveWord,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text('My Vocabulary (${controller.savedWords.length})'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openBottomSheet,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.state.value == VocabularyState.loading) {
          return const LoadingState();
        }

        if (controller.state.value == VocabularyState.error) {
          return ErrorState(
            message: controller.errorMessage.value,
            onRetry: () {
              controller.loadCatalogWords();
              controller.watchSavedWords();
            },
          );
        }

        if (controller.state.value == VocabularyState.empty) {
          return EmptyState(onAddWord: openBottomSheet);
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.savedWords.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return WordCard(word: controller.savedWords[index]);
          },
        );
      }),
    );
  }
}
