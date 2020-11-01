import 'package:flutter/material.dart';
import 'package:marvel_flutter/viewModels/CharacterViewModel.dart';
import 'package:marvel_flutter/viewModels/ComicViewModel.dart';
import 'package:marvel_flutter/views/HomeView.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CharacterViewModel>(
        create: (_) => CharacterViewModel(),
      ),
      ChangeNotifierProvider<ComicViewModel>(
        create: (_) => ComicViewModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Provider',
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
