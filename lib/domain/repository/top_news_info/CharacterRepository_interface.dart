import 'dart:async';
import 'package:news_brief/domain/domain.dart';

abstract class CharacterRepositoryInterface {
  Future<Article> ChGetById();
}
