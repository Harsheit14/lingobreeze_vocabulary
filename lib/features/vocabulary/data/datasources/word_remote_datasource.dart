import 'package:dio/dio.dart';

import '../models/catalog_word_model.dart';

class WordRemoteDataSource {
  final Dio dio;

  const WordRemoteDataSource(this.dio);

  Future<List<CatalogWordModel>> getCatalogWords() async {
    try {
      final response = await dio.get('/words');
      final data = response.data['data'] as List;

      return data
          .map(
            (item) => CatalogWordModel.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}