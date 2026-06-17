import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

class SaveWord {
  final WordRepository repository;

  const SaveWord(this.repository);

  Future<void> call(
    WordEntity word,
  ) {
    return repository.saveWord(word);
  }
}
