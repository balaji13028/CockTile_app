import 'package:cocktile_app/bloc/cocktile/cocktile_event.dart';
import 'package:cocktile_app/bloc/cocktile/cocktile_state.dart';
import 'package:cocktile_app/data/services/cocktail_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  CocktailBloc() : super(CocktailInitial()) {
    on<FetchCocktails>((event, emit) async {
      emit(CocktailLoading());
      try {
        final cocktails = await CocktailService().searchCocktails(event.query);

        emit(CocktailLoaded(cocktails));
      } catch (e) {
        emit(CocktailError(e.toString()));
      }
    });
  }
}
