import 'package:marvel_flutter/models/CharacterModel.dart';
import 'package:marvel_flutter/models/ComicModel.dart';

abstract class MarvelApi {
  Future<ComicModel> getComics();
  Future<CharacterModel> getCharacters();
}
