import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/word_entity.dart';

class SavedWordModel {
  final String id;
  final String word;
  final String meaning;
  final String translation;
  final DateTime createdAt;

  const SavedWordModel({
    required this.id,
    required this.word,
    required this.meaning,
    required this.translation,
    required this.createdAt,
  });

  factory SavedWordModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    final timestamp = data['createdAt'];

    return SavedWordModel(
      id: doc.id,
      word: data['word']?.toString() ?? '',
      meaning: data['meaning']?.toString() ?? '',
      translation: data['translation']?.toString() ?? '',
      createdAt: timestamp is Timestamp ? timestamp.toDate() : DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'word': word,
      'meaning': meaning,
      'translation': translation,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  WordEntity toEntity() {
    return WordEntity(
      id: id,
      word: word,
      meaning: meaning,
      translation: translation,
      createdAt: createdAt,
    );
  }
}
