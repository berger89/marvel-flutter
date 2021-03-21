import 'package:marvel_flutter/models/ComicModel.dart';
import 'package:marvel_flutter/models/character/Character.dart';
import 'package:marvel_flutter/models/creator/Creator.dart';
import 'package:marvel_flutter/models/generic/DataWrapper.dart';

abstract class IMarvelApi {
  Future<ComicModel> getComics();

  Future<DataWrapper<Character>> getCharacters();

  Future<DataWrapper<Creator>> getCreators();
}
