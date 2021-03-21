import 'package:marvel_flutter/api/IMarvelApi.dart';
import 'package:marvel_flutter/models/ComicModel.dart';
import 'package:marvel_flutter/models/character/Character.dart';
import 'package:marvel_flutter/models/creator/Creator.dart';
import 'package:marvel_flutter/models/generic/DataWrapper.dart';

class MarvelService {
  final IMarvelApi marvelApi;

  MarvelService(this.marvelApi);

  Future<ComicModel> getComics() async {
    return await marvelApi.getComics();
  }

  Future<DataWrapper<Character>> getCharacters() async {
    return await marvelApi.getCharacters();
  }

  Future<DataWrapper<Creator>> getCreators() async {
    return await marvelApi.getCreators();
  }
}
