import 'package:marvel_flutter/models/MarvelModel.dart';

abstract class MarvelApi {
  Future<MarvelModel> getComics();
}