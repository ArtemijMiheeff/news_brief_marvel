import 'package:json_annotation/json_annotation.dart';
part 'article1.g.dart';

@JsonSerializable()
class Article1 {
  Article1({
    required this.id,
    required this.name,
    required this.description,
    required this.firstAppearance,
    required this.creator,
  });

  final String id;
  final String name;
  final String description;
  final String firstAppearance;
  final String creator;

  factory Article1.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
