import 'dart:async';
import 'package:dio/dio.dart';
import 'package:news_brief/data/data.dart';
import 'package:news_brief/domain/domain.dart';

class CharacterRepository extends CharacterRepositoryInterface {
  CharacterRepository({required this.dio});
  final Dio dio;
  Future<Article> ChGetById() async {
    try {
      final Response response = await dio.get(
        Endpoints.getById,
// queryParameters: {
// 'pageNo': '1',
// // 'make': 'Ducati',
// // 'model': '',
// // 'type': '',
// // 'year': '',
// },
      );

      List<String> parts = Endpoints.getById.split('/');
      String id = parts.last;
      Endpoints.getById = Endpoints.getById.replaceAll(id, 'id');

      final motorcycles = Article.fromJson(response.data);
      return motorcycles;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
