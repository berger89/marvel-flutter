import 'package:marvel_flutter/api/MarvelApi.dart';
import 'package:marvel_flutter/models/MarvelModel.dart';

class ComicService {
  final MarvelApi marvelApi;

  ComicService(this.marvelApi);

  Future<MarvelModel> getComics() async {
    return await marvelApi.getComics();
  }
}
