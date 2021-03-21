import 'package:marvel_flutter/models/generic/Summary.dart';

class SeriesSummary extends Summary {
  String resourceUri;
  String name;

  SeriesSummary({this.resourceUri, this.name});

  SeriesSummary fromJson(Map<String, dynamic> json) {
    resourceUri = json['resourceURI'];
    name = json['name'];
    return new SeriesSummary(resourceUri: resourceUri, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceUri'] = this.resourceUri;
    data['name'] = this.name;
    return data;
  }
}
