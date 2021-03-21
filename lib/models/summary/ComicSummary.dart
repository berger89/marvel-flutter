import 'package:marvel_flutter/models/generic/Summary.dart';

class ComicSummary extends Summary {
  String resourceUri;
  String name;

  ComicSummary({this.resourceUri, this.name});

  ComicSummary fromJson(Map<String, dynamic> json) {
    resourceUri = json['resourceURI'];
    name = json['name'];
    return new ComicSummary(resourceUri: resourceUri, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceUri'] = this.resourceUri;
    data['name'] = this.name;
    return data;
  }
}
