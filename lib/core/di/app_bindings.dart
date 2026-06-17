import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/vocabulary/data/datasources/word_firestore_datasource.dart';
import '../../features/vocabulary/data/datasources/word_remote_datasource.dart';
import '../../features/vocabulary/data/repositories/word_repository_impl.dart';
import '../../features/vocabulary/domain/usecases/get_catalog_words.dart';
import '../../features/vocabulary/domain/usecases/save_word.dart';
import '../../features/vocabulary/domain/usecases/watch_saved_words.dart';
import '../../features/vocabulary/presentation/controllers/vocabulary_controller.dart';
import '../network/dio_client.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DioClient.create(),
      permanent: true,
    );

    Get.put(
      FirebaseFirestore.instance,
      permanent: true,
    );

    Get.put(
      WordRemoteDataSource(Get.find()),
    );

    Get.put(
      WordFirestoreDataSource(Get.find()),
    );

    Get.put(
      WordRepositoryImpl(
        remoteDataSource: Get.find(),
        firestoreDataSource: Get.find(),
      ),
    );

    Get.put(
      GetCatalogWords(Get.find<WordRepositoryImpl>()),
    );

    Get.put(
      WatchSavedWords(Get.find<WordRepositoryImpl>()),
    );

    Get.put(
      SaveWord(Get.find<WordRepositoryImpl>()),
    );

    Get.put(
      VocabularyController(
        getCatalogWordsUseCase: Get.find(),
        watchSavedWordsUseCase: Get.find(),
        saveWordUseCase: Get.find(),
      ),
    );
  }
}
