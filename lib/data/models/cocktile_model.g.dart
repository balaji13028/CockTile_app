// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocktail _$CocktailFromJson(Map<String, dynamic> json) => Cocktail(
      idDrink: json['idDrink'] as String?,
      strDrink: json['strDrink'] as String?,
      strDrinkThumb: json['strDrinkThumb'] as String?,
      strCategory: json['strCategory'] as String?,
      strGlass: json['strGlass'] as String?,
      strInstructions: json['strInstructions'] as String?,
    );

Map<String, dynamic> _$CocktailToJson(Cocktail instance) => <String, dynamic>{
      'idDrink': instance.idDrink,
      'strDrink': instance.strDrink,
      'strDrinkThumb': instance.strDrinkThumb,
      'strCategory': instance.strCategory,
      'strGlass': instance.strGlass,
      'strInstructions': instance.strInstructions,
    };
