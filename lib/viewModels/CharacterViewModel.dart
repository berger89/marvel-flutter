import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:marvel_flutter/api/MarvelApi.dart';
import 'package:marvel_flutter/models/character/Character.dart';
import 'package:marvel_flutter/models/generic/DataWrapper.dart';
import 'package:marvel_flutter/services/MarvelService.dart';

class CharacterViewModel with ChangeNotifier {
  bool isRequestPending = false;
  bool isCharacterLoaded = false;
  bool isRequestError = false;

  List<Character> _characterList;

  List<Character> get characterList => _characterList;

  MarvelService marvelService;

  CharacterViewModel() {
    marvelService = MarvelService(MarvelApi());

    getLatestCharacters();
  }

  Future<DataWrapper<Character>> getLatestCharacters() async {
    setRequestPendingState(true);
    this.isRequestError = false;

    DataWrapper<Character> latest;
    try {
      await Future.delayed(Duration(seconds: 0), () => {});

      latest = await marvelService
          .getCharacters()
          .catchError((onError) => this.isRequestError = true);
    } catch (e) {
      this.isRequestError = true;
    }

    this.isCharacterLoaded = true;
    updateModel(latest);
    setRequestPendingState(false);
    notifyListeners();
    return latest;
  }

  void setRequestPendingState(bool isPending) {
    this.isRequestPending = isPending;
    notifyListeners();
  }

  void updateModel(DataWrapper<Character> characterModel) {
    if (isRequestError) return;

    _characterList = characterModel.data.results;
  }
}
