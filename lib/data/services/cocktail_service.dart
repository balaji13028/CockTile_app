import 'package:cocktile_app/data/models/cocktile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CocktailService {
  final Dio dio = Dio();
  final String baseUrl =
      'https://www.thecocktaildb.com/api/json/v1/1/search.php';

  Future searchCocktails(String query) async {
    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {'s': query},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['drinks'];

        final cocktails = data.map((json) => Cocktail.fromJson(json)).toList();
        return cocktails;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
