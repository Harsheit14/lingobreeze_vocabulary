import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/word_entity.dart';
import '../models/saved_word_model.dart';

class WordFirestoreDataSource {
  final FirebaseFirestore firestore;

  const WordFirestoreDataSource(this.firestore);

  CollectionReference<Map<String, dynamic>> get _collection =>
      firestore.collection('saved_words');

  Future<void> saveWord(
    WordEntity word,
  ) {
    final savedWord = SavedWordModel(
      id: word.id ?? '',
      word: word.word,
      meaning: word.meaning,
      translation: word.translation,
      createdAt: word.createdAt ?? DateTime.now(),
    );

    return _collection.add(savedWord.toFirestore());
  }

  Stream<List<SavedWordModel>> watchSavedWords() {
    return _collection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => SavedWordModel.fromFirestore(doc))
          .toList();
    });
  }

  Future<bool> wordExists(
    String word,
  ) async {
    final snapshot = await _collection
        .where('word', isEqualTo: word)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }
}
