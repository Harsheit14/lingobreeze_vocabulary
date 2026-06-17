import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/word_repository.dart';
import '../datasources/word_firestore_datasource.dart';
import '../datasources/word_remote_datasource.dart';

class WordRepositoryImpl implements WordRepository {
  final WordRemoteDataSource remoteDataSource;
  final WordFirestoreDataSource firestoreDataSource;

  const WordRepositoryImpl({
    required this.remoteDataSource,
    required this.firestoreDataSource,
  });

  @override
  Future<List<WordEntity>> getCatalogWords() async {
    final words = await remoteDataSource.getCatalogWords();

    return words.map((word) => word.toEntity()).toList();
  }

  @override
  Stream<List<WordEntity>> watchSavedWords() {
    return firestoreDataSource.watchSavedWords().map((words) {
      return words.map((word) => word.toEntity()).toList();
    });
  }

  @override
  Future<void> saveWord(WordEntity word) async {
    final trimmedWord = word.word.trim();

    final normalizedWord = trimmedWord.isEmpty
        ? trimmedWord
        : trimmedWord[0].toUpperCase() + trimmedWord.substring(1).toLowerCase();

    final exists = await firestoreDataSource.wordExists(normalizedWord);

    if (exists) {
      throw Exception('This word is already saved.');
    }

    final normalizedEntity = WordEntity(
      id: word.id,
      word: normalizedWord,
      meaning: word.meaning.trim(),
      translation: word.translation.trim(),
      createdAt: word.createdAt,
    );

    return firestoreDataSource.saveWord(normalizedEntity);
  }
}
