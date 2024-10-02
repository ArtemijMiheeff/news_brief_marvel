import 'dart:async';
import 'package:news_brief/domain/domain.dart';

abstract class TopNewsRepositoryInterface {
Future<List<Article>> getTopNews();
}