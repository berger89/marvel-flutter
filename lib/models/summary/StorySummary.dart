import 'package:marvel_flutter/models/generic/Summary.dart';

class StorySummary extends Summary {
  String resourceUri;
  String name;

  StorySummary({this.resourceUri, this.name});

  StorySummary fromJson(Map<String, dynamic> json) {
    resourceUri = json['resourceURI'];
    name = json['name'];
    return new StorySummary(resourceUri: resourceUri, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceUri'] = this.resourceUri;
    data['name'] = this.name;
    return data;
  }
}
