import 'dart:core';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:marvel_flutter/api/MarvelApi.dart';
import 'package:marvel_flutter/models/ComicModel.dart';
import 'package:marvel_flutter/services/MarvelService.dart';

class ComicViewModel with ChangeNotifier {
  bool isRequestPending = false;
  bool isComicLoaded = false;
  bool isRequestError = false;

  List<ComicResults> _comicList;

  List<ComicResults> get comicList => _comicList;

  MarvelService comicService;

  ComicViewModel() {
    comicService = MarvelService(MarvelApi());

    getLatestComics();
  }

  Future<ComicModel> getLatestComics() async {
    setRequestPendingState(true);
    this.isRequestError = false;

    ComicModel latest;
    try {
      await Future.delayed(Duration(seconds: 0), () => {});

      latest = await comicService
          .getComics()
          .catchError((onError) => this.isRequestError = true);
    } catch (e) {
      log('data: $e');
      print(e.toString());
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

  void updateModel(ComicModel comicModel) {
    if (isRequestError) return;

    _comicList = comicModel.data.results;
  }
}
