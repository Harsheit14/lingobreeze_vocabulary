import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

class GetCatalogWords {
  final WordRepository repository;

  const GetCatalogWords(this.repository);

  Future<List<WordEntity>> call() {
    return repository.getCatalogWords();
  }
}
