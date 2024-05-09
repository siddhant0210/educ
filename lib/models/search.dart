

import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search{
  final int? id;
  final String? pokemon;
  final String? type;
  final List<String>? abilities;
  final int? hitpoints;
  final List<String>? evolutions;
  final String? location;
  final String? image_url;
  Search({
     this.id,
     this.pokemon,
     this.type,
     this.abilities,
     this.hitpoints,
     this.evolutions,
     this.location,
     this.image_url,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}