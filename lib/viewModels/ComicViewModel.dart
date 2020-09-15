import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:marvel_flutter/api/ComicApi.dart';
import 'package:marvel_flutter/models/MarvelModel.dart';
import 'package:marvel_flutter/services/ComicService.dart';

class ComicViewModel with ChangeNotifier {
  bool isRequestPending = false;
  bool isComicLoaded = false;
  bool isRequestError = false;

  List<Results> _comicList;

  List<Results> get comicList => _comicList;

  ComicService comicService;

  ComicViewModel() {
    comicService = ComicService(ComicApi());

    getLatestComics();
  }

  Future<MarvelModel> getLatestComics() async {
    setRequestPendingState(true);
    this.isRequestError = false;

    MarvelModel latest;
    try {
      await Future.delayed(Duration(seconds: 0), () => {});

      latest = await comicService
          .getComics()
          .catchError((onError) => this.isRequestError = true);
    } catch (e) {
      this.isRequestError = true;
    }

    this.isComicLoaded = true;
    updateModel(latest);
    setRequestPendingState(false);
    notifyListeners();
    return latest;
  }

  void setRequestPendingState(bool isPending) {
    this.isRequestPending = isPending;
    notifyListeners();
  }

  void updateModel(MarvelModel comics) {
    if (isRequestError) return;

    _comicList = comics.data.results;
  }
}
