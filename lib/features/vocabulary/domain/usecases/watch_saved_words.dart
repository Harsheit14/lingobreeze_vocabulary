import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

class WatchSavedWords {
  final WordRepository repository;

  const WatchSavedWords(this.repository);

  Stream<List<WordEntity>> call() {
    return repository.watchSavedWords();
  }
}
