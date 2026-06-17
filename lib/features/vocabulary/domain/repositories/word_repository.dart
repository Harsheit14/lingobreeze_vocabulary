import '../entities/word_entity.dart';

abstract class WordRepository {
  Future<List<WordEntity>> getCatalogWords();

  Stream<List<WordEntity>> watchSavedWords();

  Future<void> saveWord(
    WordEntity word,
  );
}
