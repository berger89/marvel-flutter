import 'package:marvel_flutter/models/ComicModel.dart';

abstract class MarvelApi {
  Future<MarvelModel> getComics();
  Future<MarvelModel> getCharacters();

}