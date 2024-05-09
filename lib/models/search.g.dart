// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      id: json['id'] as int?,
      pokemon: json['pokemon'] as String?,
      type: json['type'] as String?,
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hitpoints: json['hitpoints'] as int?,
      evolutions: (json['evolutions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'id': instance.id,
      'pokemon': instance.pokemon,
      'type': instance.type,
      'abilities': instance.abilities,
      'hitpoints': instance.hitpoints,
      'evolutions': instance.evolutions,
      'location': instance.location,
      'image_url': instance.image_url,
    };
