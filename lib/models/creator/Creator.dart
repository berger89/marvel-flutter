import 'package:marvel_flutter/models/generic/Data.dart';
import 'package:marvel_flutter/models/lists/ComicList.dart';
import 'package:marvel_flutter/models/lists/EventList.dart';
import 'package:marvel_flutter/models/lists/SeriesList.dart';
import 'package:marvel_flutter/models/lists/StoryList.dart';
import 'package:marvel_flutter/models/summary/ComicSummary.dart';
import 'package:marvel_flutter/models/summary/EventSummary.dart';
import 'package:marvel_flutter/models/summary/SeriesSummary.dart';
import 'package:marvel_flutter/models/summary/StorySummary.dart';

import '../generic/Thumbnail.dart';
import '../generic/Url.dart';

class Creator extends Data {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String suffix;
  String fullName;
  String modified;
  String resourceUri;
  List<Url> urls;
  Thumbnail thumbnail;
  SeriesList series;
  StoryList stories;
  ComicList comics;
  EventList events;

  Creator(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.suffix,
      this.fullName,
      this.modified,
      this.resourceUri,
      this.urls,
      this.thumbnail,
      this.stories,
      this.events,
      this.comics,
      this.series});

  @override
  Creator fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    suffix = json['suffix'];
    fullName = json['fullName'];
    modified = json['modified'];
    resourceUri = json['resourceUri'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    series = json['series'] != null
        ? new SeriesList().fromJson(json['series'], new SeriesSummary())
        : null;
    comics = json['comics'] != null
        ? new ComicList().fromJson(json['comics'], new ComicSummary())
        : null;
    stories = json['stories'] != null
        ? new StoryList().fromJson(json['stories'], new StorySummary())
        : null;
    events = json['events'] != null
        ? new EventList().fromJson(json['events'], new EventSummary())
        : null;

    if (json['urls'] != null) {
      urls = new List<Url>();
      json['urls'].forEach((v) {
        urls.add(new Url.fromJson(v));
      });
    }
    return new Creator(
        id: id,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        suffix: suffix,
        fullName: fullName,
        modified: modified,
        resourceUri: resourceUri,
        urls: urls,
        thumbnail: thumbnail,
        stories: stories,
        series: series,
        events: events,
        comics: comics);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['suffix'] = this.suffix;
    data['fullName'] = this.fullName;
    data['modified'] = this.modified;
    data['resourceUri'] = this.resourceUri;

    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    if (this.thumbnail != null) data['thumbnail'] = this.thumbnail.toJson();

    return data;
  }
}
