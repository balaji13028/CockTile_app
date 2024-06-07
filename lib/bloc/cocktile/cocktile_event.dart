import 'package:equatable/equatable.dart';

abstract class CocktailEvent extends Equatable {
  const CocktailEvent();

  @override
  List<Object> get props => [];
}

class FetchCocktails extends CocktailEvent {
  final String query;

  const FetchCocktails(this.query);

  @override
  List<Object> get props => [query];
}
