import 'package:cocktile_app/bloc/cocktile/cocktile_bloc.dart';
import 'package:cocktile_app/view/pages/cocktile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CocktailBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The CockTile',
        theme: ThemeData.light(
          useMaterial3: true,
        ).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.blue,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        home: const CocktailList(),
      ),
    );
  }
}
