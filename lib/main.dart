import 'package:flutter/material.dart';
import 'package:marvel_flutter/viewModels/CharacterViewModel.dart';
import 'package:marvel_flutter/viewModels/ComicViewModel.dart';
import 'package:marvel_flutter/viewModels/CreatorViewModel.dart';
import 'package:marvel_flutter/views/ComicDetailScreen.dart';
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
      ChangeNotifierProvider<CreatorViewModel>(
        create: (_) => CreatorViewModel(),
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
        initialRoute: HomeView.nameId,
        routes: {
          HomeView.nameId: (context) => HomeView(),
          ComicDetailScreen.nameId: (context) => ComicDetailScreen(),
        });
  }
}
