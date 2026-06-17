class WordEntity {
  final String? id;
  final String word;
  final String meaning;
  final String translation;
  final DateTime? createdAt;

  const WordEntity({
    this.id,
    required this.word,
    required this.meaning,
    required this.translation,
    this.createdAt,
  });
}
