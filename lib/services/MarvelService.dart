import 'package:marvel_flutter/api/IMarvelApi.dart';
import 'package:marvel_flutter/models/CharacterModel.dart';
import 'package:marvel_flutter/models/ComicModel.dart';

class MarvelService {
  final MarvelApi marvelApi;

  MarvelService(this.marvelApi);

  Future<ComicModel> getComics() async {
    return await marvelApi.getComics();
  }

  Future<CharacterModel> getCharacters() async {
    return await marvelApi.getCharacters();
  }
}
