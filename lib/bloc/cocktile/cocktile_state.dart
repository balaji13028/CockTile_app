import 'package:cocktile_app/data/models/cocktile_model.dart';
import 'package:equatable/equatable.dart';

abstract class CocktailState extends Equatable {
  const CocktailState();

  @override
  List<Object> get props => [];
}

class CocktailInitial extends CocktailState {}

class CocktailLoading extends CocktailState {}

class CocktailLoaded extends CocktailState {
  final List<Cocktail> cocktails;

  const CocktailLoaded(this.cocktails);

  @override
  List<Object> get props => [cocktails];
}

class CocktailError extends CocktailState {
  final String message;

  const CocktailError(this.message);

  @override
  List<Object> get props => [message];
}
