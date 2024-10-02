import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    // required this.make,
    // required this.model,
    // required this.year,
    // required this.type,
    // required this.displacement,
    // required this.engine,
    // required this.power,
    // required this.cooling,
    // required this.gearbox,
    // required this.transmission,
    // required this.total_weight,
    // required this.fuel_capacity,
    required this.id,
    required this.name,
    required this.description,
    required this.firstAppearance,
    required this.creator,
  });

  // final String make;
  // final String model;
  // final String year;
  // final String type;
  // final String displacement;
  // final String engine;
  // final String power;
  // final String cooling;
  // final String gearbox;
  // final String transmission;
  // final String total_weight;
  // final String fuel_capacity;
  final int id;
  final String name;
  final String description;
  final String firstAppearance;
  final String creator;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
