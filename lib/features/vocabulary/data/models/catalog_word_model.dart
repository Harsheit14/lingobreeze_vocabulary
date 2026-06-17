import '../../domain/entities/word_entity.dart';

class CatalogWordModel {
  final String word;
  final String meaning;
  final String translation;

  const CatalogWordModel({
    required this.word,
    required this.meaning,
    required this.translation,
  });

  factory CatalogWordModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CatalogWordModel(
      word: json['word'] as String,
      meaning: json['meaning'] as String,
      translation: json['translation'] as String,
    );
  }

  WordEntity toEntity() {
    return WordEntity(
      word: word,
      meaning: meaning,
      translation: translation,
    );
  }
}
