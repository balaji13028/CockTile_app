// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part "./cocktile_model.g.dart";

@JsonSerializable()
class Cocktail {
  String? idDrink;
  String? strDrink;
  String? strDrinkThumb;
  String? strCategory;
  String? strGlass;
  String? strInstructions;
  Cocktail({
    this.idDrink,
    this.strDrink,
    this.strDrinkThumb,
    this.strCategory,
    this.strGlass,
    this.strInstructions,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
  Map<String, dynamic> toJson() => _$CocktailToJson(this);

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'idDrink': idDrink,
  //     'strDrink': strDrink,
  //     'strDrinkThumb': strDrinkThumb,
  //     'strCategory': strCategory,
  //     'strGlass': strGlass,
  //     'strInstructions': strInstructions,
  //   };
  // }

  // factory Cocktail.fromMap(Map<String, dynamic> map) {
  //   return Cocktail(
  //     idDrink: map['idDrink'] != null ? map['idDrink'] as String : null,
  //     strDrink: map['strDrink'] != null ? map['strDrink'] as String : null,
  //     strDrinkThumb:
  //         map['strDrinkThumb'] != null ? map['strDrinkThumb'] as String : null,
  //     strCategory:
  //         map['strCategory'] != null ? map['strCategory'] as String : null,
  //     strGlass: map['strGlass'] != null ? map['strGlass'] as String : null,
  //     strInstructions: map['strInstructions'] != null
  //         ? map['strInstructions'] as String
  //         : null,
  //   );
  // }
}
