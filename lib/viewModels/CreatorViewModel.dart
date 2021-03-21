import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:marvel_flutter/api/MarvelApi.dart';
import 'package:marvel_flutter/models/creator/Creator.dart';
import 'package:marvel_flutter/models/generic/DataWrapper.dart';
import 'package:marvel_flutter/services/MarvelService.dart';

class CreatorViewModel with ChangeNotifier {
  bool isRequestPending = false;
  bool isCreatorLoaded = false;
  bool isRequestError = false;

  List<Creator> _creatorList;

  List<Creator> get creatorList => _creatorList;

  MarvelService marvelService;

  CreatorViewModel() {
    marvelService = MarvelService(MarvelApi());

    getLatestCreators();
  }

  Future<DataWrapper<Creator>> getLatestCreators() async {
    setRequestPendingState(true);
    this.isRequestError = false;

    DataWrapper<Creator> latest;
    try {
      await Future.delayed(Duration(seconds: 0), () => {});

      latest = await marvelService
          .getCreators()
          .catchError((onError) => this.isRequestError = true);
    } catch (e) {
      this.isRequestError = true;
    }

    this.isCreatorLoaded = true;
    updateModel(latest);
    setRequestPendingState(false);
    notifyListeners();
    return latest;
  }

  void setRequestPendingState(bool isPending) {
    this.isRequestPending = isPending;
    notifyListeners();
  }

  void updateModel(DataWrapper<Creator> creatorModel) {
    if (isRequestError) return;

    _creatorList = creatorModel.data.results;
  }
}
