import 'package:marvel_flutter/api/MarvelApi.dart';
import 'package:marvel_flutter/models/ComicModel.dart';

class MarvelService {
  final MarvelApi marvelApi;

  MarvelService(this.marvelApi);

  Future<MarvelModel> getComics() async {
    return await marvelApi.getComics();
  }

  Future<MarvelModel> getCharacters() async {
    return await marvelApi.getCharacters();
  }
}
