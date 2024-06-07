import 'package:cocktile_app/bloc/cocktile/cocktile_bloc.dart';
import 'package:cocktile_app/bloc/cocktile/cocktile_event.dart';
import 'package:cocktile_app/bloc/cocktile/cocktile_state.dart';
import 'package:cocktile_app/view/pages/cocktile_details.dart';
import 'package:cocktile_app/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailList extends StatefulWidget {
  const CocktailList({super.key});

  @override
  _CocktailListState createState() => _CocktailListState();
}

class _CocktailListState extends State<CocktailList> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            // centerTitle: false,
            title: const Text(' Welcome to Cocktails'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CusttomTextField(
                  text: 'Search',
                  controller: _controller,
                  suffix: const Icon(Icons.search),
                  onChanged: (value) {
                    BlocProvider.of<CocktailBloc>(context)
                        .add(FetchCocktails(_controller.text));
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<CocktailBloc, CocktailState>(
                    builder: (context, state) {
                      if (state is CocktailLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CocktailLoaded) {
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemCount: state.cocktails.length,
                          itemBuilder: (context, index) {
                            final cocktail = state.cocktails[index];
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              horizontalTitleGap: 10,
                              title: Text(
                                cocktail.strDrink.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                cocktail.strCategory.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              leading: SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.network(
                                  cocktail.strDrinkThumb.toString(),
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CockTileDetails(cocktail: cocktail),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (state is CocktailError) {
                        return const Center(child: Text('Not founded'));
                      }
                      return const Center(
                          child: Text('Search for a Cocktiles'));
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
