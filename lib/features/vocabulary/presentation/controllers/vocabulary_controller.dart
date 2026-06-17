import 'dart:async';

import 'package:get/get.dart';

import '../../domain/entities/word_entity.dart';
import '../../domain/usecases/get_catalog_words.dart';
import '../../domain/usecases/save_word.dart';
import '../../domain/usecases/watch_saved_words.dart';
import 'vocabulary_state.dart';

class VocabularyController extends GetxController {
  final GetCatalogWords getCatalogWordsUseCase;
  final WatchSavedWords watchSavedWordsUseCase;
  final SaveWord saveWordUseCase;

  VocabularyController({
    required this.getCatalogWordsUseCase,
    required this.watchSavedWordsUseCase,
    required this.saveWordUseCase,
  });

  final state = VocabularyState.loading.obs;
  final savedWords = <WordEntity>[].obs;
  final catalogWords = <WordEntity>[].obs;
  final errorMessage = ''.obs;

  StreamSubscription<List<WordEntity>>? _subscription;

  @override
  void onInit() {
    super.onInit();
    loadCatalogWords();
    watchSavedWords();
  }

  Future<void> loadCatalogWords() async {
    try {
      final words = await getCatalogWordsUseCase();
      catalogWords.assignAll(words);
    } catch (error) {
      errorMessage.value = error.toString();
      state.value = VocabularyState.error;
    }
  }

  void watchSavedWords() {
    _subscription = watchSavedWordsUseCase().listen(
      (words) {
        savedWords.assignAll(words);
        state.value = words.isEmpty
            ? VocabularyState.empty
            : VocabularyState.loaded;
      },
      onError: (error) {
        errorMessage.value = error.toString();
        state.value = VocabularyState.error;
      },
    );
  }

  Future<void> saveWord(WordEntity word) async {
    try {
      await saveWordUseCase(word);
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
