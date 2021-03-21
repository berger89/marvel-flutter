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

class Character extends Data {
  int id;
  String name;
  String description;
  String modified;
  String resourceUri;
  List<Url> urls;
  Thumbnail thumbnail;
  SeriesList series;
  StoryList stories;
  ComicList comics;
  EventList events;

  Character(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.resourceUri,
      this.urls,
      this.thumbnail,
      this.comics,
      this.stories,
      this.events,
      this.series});

  @override
  Character fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    resourceUri = json['resourceUri'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    series = json['series'] != null
        ? SeriesList().fromJson(json['series'], new SeriesSummary())
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
    return new Character(
        id: id,
        name: name,
        description: description,
        modified: modified,
        resourceUri: resourceUri,
        thumbnail: thumbnail,
        series: series,
        comics: comics,
        stories: stories,
        events: events,
        urls: urls);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['resourceUri'] = this.resourceUri;

    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    if (this.thumbnail != null) data['thumbnail'] = this.thumbnail.toJson();

    return data;
  }
}
